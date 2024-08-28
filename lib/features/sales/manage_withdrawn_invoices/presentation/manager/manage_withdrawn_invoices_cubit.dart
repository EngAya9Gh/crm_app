import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_manage_withdrawn_invoices_entity.dart';
import '../../domain/entities/manage_withdrawn_invoices_page_variables_entity.dart';
import '../../domain/use_cases/get_manage_withdrawn_invoices_usecase.dart';

part 'manage_withdrawn_invoices_state.dart';

@injectable
class ManageWithdrawnInvoicesCubit extends Cubit<ManageWithdrawnInvoicesState> {
  final GetManageWithdrawnInvoicesUsecase _getManageWithdrawnInvoicesUsecase;

  ManageWithdrawnInvoicesCubit(
    this._getManageWithdrawnInvoicesUsecase,
  ) : super(ManageWithdrawnInvoicesState());

  ManageWithdrawnInvoicesPageVariablesEntity pageVariables =
      ManageWithdrawnInvoicesPageVariablesEntity();
  FilterManageWithdrawnInvoicesEntity filterEntity =
      FilterManageWithdrawnInvoicesEntity();

  void init() {
    pageVariables = ManageWithdrawnInvoicesPageVariablesEntity();
    filterEntity = FilterManageWithdrawnInvoicesEntity();
  }

  Future<void> getManageWithdrawnInvoices({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getManageWithdrawnInvoicesStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getWithdrawnInvoicesStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getManageWithdrawnInvoicesUsecase(
          GetManageWithdrawnInvoicesParams(
            skip: pageVariables.allList.length,
            searchQuery: pageVariables.searchController.text,
            status: filterEntity.statusNotifier.value,
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
      tag: 'search_manage_withdrawn_invoices',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
