import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../domain/entities/filter_manage_withdrawn_invoices_entity.dart';
import '../../domain/entities/manage_withdrawn_invoices_page_variables_entity.dart';
import '../../domain/use_cases/get_manage_withdrawn_invoices_usecase.dart';
import 'package:collection/collection.dart';

part 'manage_withdrawn_invoices_state.dart';

@injectable
class ManageWithdrawnInvoicesCubit extends Cubit<ManageWithdrawnInvoicesState> with HydratedMixin {
  final GetManageWithdrawnInvoicesUsecase _getManageWithdrawnInvoicesUsecase;

  ManageWithdrawnInvoicesCubit(
    this._getManageWithdrawnInvoicesUsecase,
  ) : super(ManageWithdrawnInvoicesState()) {
    hydrate();
  }

  ManageWithdrawnInvoicesPageVariablesEntity pageVariables = ManageWithdrawnInvoicesPageVariablesEntity();
  FilterManageWithdrawnInvoicesEntity filterEntity = FilterManageWithdrawnInvoicesEntity();

  void init() {
    pageVariables = ManageWithdrawnInvoicesPageVariablesEntity();
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
            branch: filterEntity.branchNotifier.value,
            fkIdUser: filterEntity.selectedUserSales.value?.id,
            userWithdraw: filterEntity.withDrawnUser.value?.id,
            sortAsc: filterEntity.sortAsc.value,
            from: filterEntity.dateApproveFromController.text,
            to: filterEntity.dateApproveToController.text,
            dateWithdrawnFrom: filterEntity.dateWithdrawnFromController.text,
            dateWithdrawnTo: filterEntity.dateWithdrawnToController.text,
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

  @override
  ManageWithdrawnInvoicesState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.statusNotifier.value = WithdrawalInvoiceStatusEnum.values.firstWhereOrNull(
            (element) => element.value == json[AppStrings.manageWithdrawnInvoice.statusNotifier],
          ) ??
          WithdrawalInvoiceStatusEnum.user;
      filterEntity.branchNotifier.value = json[AppStrings.manageWithdrawnInvoice.branchNotifier] == null
          ? []
          : (json[AppStrings.manageWithdrawnInvoice.branchNotifier] as List<dynamic>).map((e) => BranchModel.fromJson(e)).toList();
      filterEntity.selectedUserSales.value = json[AppStrings.manageWithdrawnInvoice.selectedUserSales] == null
          ? null
          : UserEntity.fromMap(json[AppStrings.manageWithdrawnInvoice.selectedUserSales]);
      filterEntity.withDrawnUser.value = json[AppStrings.manageWithdrawnInvoice.withDrawnUser] == null
          ? null
          : UserModel.fromJson(json[AppStrings.manageWithdrawnInvoice.withDrawnUser]);
      filterEntity.sortAsc.value = json[AppStrings.manageWithdrawnInvoice.sortType];
      filterEntity.dateApproveFromController.text = json[AppStrings.manageWithdrawnInvoice.fromDate];
      filterEntity.dateApproveToController.text = json[AppStrings.manageWithdrawnInvoice.toDate];
      filterEntity.dateWithdrawnFromController.text = json[AppStrings.manageWithdrawnInvoice.drawnFrom];
      filterEntity.dateWithdrawnToController.text = json[AppStrings.manageWithdrawnInvoice.drawnTo];

      return state;
    } catch (e) {
      debugPrint("error is => $e");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ManageWithdrawnInvoicesState state) {
    return {
      AppStrings.manageWithdrawnInvoice.statusNotifier: filterEntity.statusNotifier.value.toString(),
      if (filterEntity.branchNotifier.value.isNotEmpty)
        AppStrings.manageWithdrawnInvoice.branchNotifier: List.from(filterEntity.branchNotifier.value.map((x) => x.toJson())),
      if (filterEntity.selectedUserSales.value != null)
        AppStrings.manageWithdrawnInvoice.selectedUserSales: filterEntity.selectedUserSales.value!.toMap(),
      if (filterEntity.withDrawnUser.value != null) AppStrings.manageWithdrawnInvoice.withDrawnUser: filterEntity.withDrawnUser.value!.toJson(),
      AppStrings.manageWithdrawnInvoice.sortType: filterEntity.sortAsc.value,
      AppStrings.manageWithdrawnInvoice.fromDate: filterEntity.dateApproveFromController.text,
      AppStrings.manageWithdrawnInvoice.toDate: filterEntity.dateApproveToController.text,
      AppStrings.manageWithdrawnInvoice.drawnFrom: filterEntity.dateWithdrawnFromController.text,
      AppStrings.manageWithdrawnInvoice.drawnTo: filterEntity.dateWithdrawnToController.text,
    };
  }
}
