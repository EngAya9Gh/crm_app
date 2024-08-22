import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../domain/entities/filter_support_clients_invoices_entity.dart';
import '../../domain/entities/support_clients_invoices_page_variables_entity.dart';
import '../../domain/use_cases/get_support_clients_invoices_use_case.dart';

part 'support_clients_invoices_state.dart';

@injectable
class SupportClientsInvoicesCubit extends Cubit<SupportClientsInvoicesState> {
  final GetSupportClientsInvoicesUseCase _getDelayInstallReportsUsecase;

  SupportClientsInvoicesCubit(
    this._getDelayInstallReportsUsecase,
  ) : super(SupportClientsInvoicesState());

  SupportClientsInvoicesPageVariablesEntity pageVariables =
      SupportClientsInvoicesPageVariablesEntity();
  FilterSupportClientsInvoicesEntity filterEntity =
      FilterSupportClientsInvoicesEntity();

  void changeGettingCitiesFromRegionsStatus({
    bool success = false,
    bool loading = false,
  }) {
    if (success) {
      emit(state.copyWith(getCitiesFromRegions: BlocStatus.success()));
      return;
    }
    emit(state.copyWith(getCitiesFromRegions: BlocStatus.loading()));
  }

  void init() {
    pageVariables = SupportClientsInvoicesPageVariablesEntity();
    filterEntity = FilterSupportClientsInvoicesEntity();
  }

  Future<void> loadCities(BuildContext context) async {
    emit(state.copyWith(getSupportClientInvoicesStatus: BlocStatus.loading()));
    final _mainCityProvider = context.read<MainCityProvider>();
    filterEntity.regionsNotifier.value = List<MainCityModel>.from(
      await _mainCityProvider
          .filterMainCityByCurrentUserMainCityList(AppConstants.currentUser),
    );
    await _mainCityProvider.getCitiesFromRegions();
    filterEntity.citiesNotifier.value = _mainCityProvider.filteredCitiesList;
    filterEntity.allRegionsCount = filterEntity.regionsNotifier.value.length;
    filterEntity.allCitiesCount = filterEntity.citiesNotifier.value.length;
  }

  Future<void> getSupportClientInvoices({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        // if (state.getSupportClientInvoicesStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getSupportClientInvoicesStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getDelayInstallReportsUsecase(
          GetSupportClientsInvoicesParams(
            fkCountry: fkCountry,
            selectedCities: filterEntity.citiesNotifier.value,
            searchQuery: pageVariables.searchController.text,
            page: pageVariables.allList.length,
            listSelectedRegions: filterEntity.regionsNotifier.value,
            state: filterEntity.statusNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getSupportClientInvoicesStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getSupportClientInvoicesStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getSupportClientInvoicesStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_support_clients_invoices',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
