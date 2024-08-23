import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/entities/filter_pending_invoices_entity.dart';
import '../../domain/entities/pending_invoices_page_variables_entity.dart';
import '../../domain/use_cases/get_pending_invoices_usecase.dart';

part 'pending_invoices_state.dart';

@injectable
class PendingInvoicesCubit extends Cubit<PendingInvoicesState> {
  final GetPendingInvoicesUsecase _getPendingInvoicesUsecase;

  PendingInvoicesCubit(
    this._getPendingInvoicesUsecase,
  ) : super(PendingInvoicesState());

  PendingInvoicesPageVariablesEntity pageVariables =
      PendingInvoicesPageVariablesEntity();
  FilterPendingInvoicesEntity filterEntity = FilterPendingInvoicesEntity();

  void init() {
    pageVariables = PendingInvoicesPageVariablesEntity();
    filterEntity = FilterPendingInvoicesEntity();
  }

  Future<void> getPendingInvoices({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getPendingInvoicesStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getPendingInvoicesStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPendingInvoicesUsecase(
          GetPendingInvoicesParams(
            fkRegion: filterEntity.regionNotifier.value?.branchId,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getPendingInvoicesStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterPendingInvoices();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getPendingInvoicesStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getPendingInvoicesStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_pending_invoices',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterPendingInvoices() {
    emit(state.copyWith(
      filterPendingInvoicesStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      filterPendingInvoicesStatus: BlocStatus.success(),
    ));
  }

  void removeApprovedInvoice(String invoiceId) {
    emit(state.copyWith(getPendingInvoicesStatus: BlocStatus.loading()));
    pageVariables.allList
        .removeWhere((element) => element.idInvoice == invoiceId);
    pageVariables.filteredList
        .removeWhere((element) => element.idInvoice == invoiceId);
    emit(state.copyWith(getPendingInvoicesStatus: BlocStatus.success()));
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
