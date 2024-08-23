import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/entities/filter_finance_pending_entity.dart';
import '../../domain/entities/finance_pending_page_variables_entity.dart';
import '../../domain/use_cases/get_finance_pending_invoices_usecase.dart';

part 'finance_pending_state.dart';

@injectable
class FinancePendingCubit extends Cubit<FinancePendingState> {
  final GetFinancePendingInvoicesUsecase _getFinancePendingInvoicesUsecase;

  FinancePendingCubit(
    this._getFinancePendingInvoicesUsecase,
  ) : super(FinancePendingState());

  FinancePendingPageVariablesEntity pageVariables =
      FinancePendingPageVariablesEntity();
  FilterFinancePendingEntity filterEntity = FilterFinancePendingEntity();

  void init() {
    pageVariables = FinancePendingPageVariablesEntity();
    filterEntity = FilterFinancePendingEntity();
  }

  Future<void> getFinancePendingInvoices({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getFinancePendingStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getFinancePendingStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getFinancePendingInvoicesUsecase(
          GetFinancePendingInvoicesParams(),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getFinancePendingStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterFinancePendingInvoices();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getFinancePendingStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getFinancePendingStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_finance_pending',
      isDebounced: isDebounced,
    );
  }

  void filterFinancePendingInvoices() {
    emit(state.copyWith(
      filterFinancePendingStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      filterFinancePendingStatus: BlocStatus.success(),
    ));
  }

  // remove approved invoice using id
  void removeApprovedInvoice(String id) {
    emit(state.copyWith(getFinancePendingStatus: BlocStatus.loading()));
    pageVariables.allList.removeWhere((element) => element.idInvoice == id);
    pageVariables.filteredList
        .removeWhere((element) => element.idInvoice == id);
    emit(state.copyWith(getFinancePendingStatus: BlocStatus.success()));
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
