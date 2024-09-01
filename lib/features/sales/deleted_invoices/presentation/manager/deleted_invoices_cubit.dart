import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/deleted_invoices_page_variables_entity.dart';
import '../../domain/entities/filter_deleted_invoices_entity.dart';
import '../../domain/use_cases/get_deleted_invoices_usecase.dart';

part 'deleted_invoices_state.dart';

@injectable
class DeletedInvoicesCubit extends Cubit<DeletedInvoicesState> {
  final GetDeletedInvoicesUsecase _getDeletedInvoicesUsecase;

  DeletedInvoicesCubit(
    this._getDeletedInvoicesUsecase,
  ) : super(DeletedInvoicesState());

  DeletedInvoicesPageVariablesEntity pageVariables =
      DeletedInvoicesPageVariablesEntity();
  FilterDeletedInvoicesEntity filterEntity = FilterDeletedInvoicesEntity();

  void init() {
    pageVariables = DeletedInvoicesPageVariablesEntity();
    filterEntity = FilterDeletedInvoicesEntity();
  }

  Future<void> getDeletedInvoices({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getDeletedInvoicesStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getDeletedStatus: BlocStatus.loading()));
        final result = await _getDeletedInvoicesUsecase(
          GetDeletedParams(
            skip: pageVariables.allList.length,
            searchQuery: pageVariables.searchController.text,
            branch: filterEntity.branchNotifier.value,
            user: filterEntity.userNotifier.value,
            from: filterEntity.dateFromController.text,
            to: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getDeletedStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getDeletedStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getDeletedStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_deleted_invoices',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
