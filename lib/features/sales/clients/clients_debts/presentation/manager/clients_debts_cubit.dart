import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/enums/invoice_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/entities/clients_debts_page_variables_entity.dart';
import '../../domain/entities/filter_clients_debts_entity.dart';
import '../../domain/use_cases/get_clients_debts_usecase.dart';

part 'clients_debts_state.dart';

@injectable
class ClientsDebtsCubit extends Cubit<ClientsDebtsState> {
  final GetClientsDebtsUsecase _getClientsDebtsUsecase;

  ClientsDebtsCubit(
    this._getClientsDebtsUsecase,
  ) : super(ClientsDebtsState());

  ClientsDebtsPageVariablesEntity pageVariables =
      ClientsDebtsPageVariablesEntity();
  FilterClientsDebtsEntity filterEntity = FilterClientsDebtsEntity();

  void init() {
    pageVariables = ClientsDebtsPageVariablesEntity();
    filterEntity = FilterClientsDebtsEntity();
  }

  Future<void> getClientsDebts({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getClientsDebtsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getClientsDebtsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getClientsDebtsUsecase(
          GetClientsDebtsParams(
            fkRegion: filterEntity.regionNotifier.value?.regionId,
            invoiceState: filterEntity.invoiceStateNotifier.value?.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getClientsDebtsStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterClientsDebts();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getClientsDebtsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getClientsDebtsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_clients_debts',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterClientsDebts() {
    emit(state.copyWith(
      filterClientsDebtsStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      filterClientsDebtsStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    pageVariables.filteredList =
        List<InvoiceModel>.from(pageVariables.allList.where((element) {
      return element.searchString(pageVariables.searchController.text);
    }));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
