import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/withdrawn_invoices_filter_entity.dart';
import '../../domain/entities/withdrawn_invoices_page_variables_entity.dart';
import '../../domain/use_cases/get_withdrawn_invoices_usecase.dart';

part 'withdrawn_invoices_state.dart';

@injectable
class WithdrawnInvoicesCubit extends Cubit<WithdrawnInvoicesState> {
  final GetWithdrawnInvoicesUsecase _getWithdrawnInvoicesUsecase;

  WithdrawnInvoicesCubit(
    this._getWithdrawnInvoicesUsecase,
  ) : super(WithdrawnInvoicesState());

  WithdrawnInvoicesPageVariablesEntity pageVariables =
      WithdrawnInvoicesPageVariablesEntity();
  FilterWithdrawnInvoicesEntity filterEntity = FilterWithdrawnInvoicesEntity();

  void init() {
    pageVariables = WithdrawnInvoicesPageVariablesEntity();
    filterEntity = FilterWithdrawnInvoicesEntity();
  }

  Future<void> getWithdrawnInvoices({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getWithdrawnInvoicesStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getWithdrawnInvoicesStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getWithdrawnInvoicesUsecase(
          GetWithdrawnInvoicesParams(
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
              getWithdrawnInvoicesStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getWithdrawnInvoicesStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getWithdrawnInvoicesStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_withdrawn_invoices',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
