import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../model/usermodel.dart';
import '../../domain/entities/clients_debts_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_debts_reports_entity.dart';
import '../../domain/use_cases/get_clients_debts_reports_usecase.dart';

part 'clients_debts_reports_state.dart';

@injectable
class ClientsDebtsReportsCubit extends Cubit<ClientsDebtsReportsState>
    with HydratedMixin {
  final GetClientsDebtsReportsUsecase _getClientsDebtsReportsUsecase;

  ClientsDebtsReportsCubit(
    this._getClientsDebtsReportsUsecase,
  ) : super(ClientsDebtsReportsState()) {
    hydrate();
  }

  ClientsDebtsReportsPageVariablesEntity pageVariables =
      ClientsDebtsReportsPageVariablesEntity();
  FilterClientsDebtsReportsEntity filterEntity =
      FilterClientsDebtsReportsEntity();

  void init() {
    pageVariables = ClientsDebtsReportsPageVariablesEntity();
  }

  Future<void> getClientDebtsReports() async {
    if (state.getClientsDebtsReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsDebtsReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsDebtsReportsUsecase(
      GetClientsDebtsReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        region: filterEntity.regionNotifier.value,
        user: filterEntity.userNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getClientsDebtsReportsStatus: BlocStatus.fail(error: e),
      )),
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getClientsDebtsReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getClientsDebtsReportsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  void _clear() {
    pageVariables.allList.clear();
    pageVariables.totalValue = 0;
    pageVariables.dataRows.clear();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }

  @override
  ClientsDebtsReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.clientsDebtsReportsCubit.reportTypeNotifier],
      );
      final region = json[AppStrings.clientsDebtsReportsCubit.regionNotifier];
      if (region != null) {
        filterEntity.setRegionNotifierValue = RegionModel.fromJson(region);
      }
      final user = json[AppStrings.clientsDebtsReportsCubit.userNotifier];
      if (user != null) {
        filterEntity.setUserNotifierValue = UserModel.fromJson(user);
      }
      filterEntity.setIsMarketingNotifierValue =
          json[AppStrings.clientsDebtsReportsCubit.isMarketingNotifier];

      return state;
    } catch (e) {
      debugPrint("error is => $e");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ClientsDebtsReportsState state) {
    return {
      AppStrings.clientsDebtsReportsCubit.reportTypeNotifier:
          filterEntity.reportTypeNotifier.value.toString(),
      AppStrings.clientsDebtsReportsCubit.regionNotifier:
          filterEntity.regionNotifier.value?.toJson(),
      AppStrings.clientsDebtsReportsCubit.userNotifier:
          filterEntity.userNotifier.value?.toJson(),
      AppStrings.clientsDebtsReportsCubit.isMarketingNotifier:
          filterEntity.isMarketingNotifier.value,
    };
  }
}
