import 'package:flutter/material.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/usermodel.dart';

class FilterManageWithdrawnInvoicesEntity {
  FilterManageWithdrawnInvoicesEntity();

  ValueNotifier<WithdrawalInvoiceStatusEnum> statusNotifier = ValueNotifier<WithdrawalInvoiceStatusEnum>(WithdrawalInvoiceStatusEnum.user);
  ValueNotifier<List<BranchModel>> branchNotifier = ValueNotifier<List<BranchModel>>([]);
  final ValueNotifier<UserEntity?> selectedUserSales = ValueNotifier(null);
  final ValueNotifier<UserModel?> withDrawnUser = ValueNotifier(null);
  final ValueNotifier<bool> sortAsc = ValueNotifier(true);
  TextEditingController dateApproveFromController = TextEditingController();
  TextEditingController dateApproveToController = TextEditingController();
  TextEditingController dateWithdrawnFromController = TextEditingController();
  TextEditingController dateWithdrawnToController = TextEditingController();

  void clearFilters() {
    statusNotifier.value = WithdrawalInvoiceStatusEnum.user;
    branchNotifier.value = [];
    selectedUserSales.value = null;
    withDrawnUser.value = null;
    dateApproveFromController.clear();
    dateApproveToController.clear();
    dateWithdrawnFromController.clear();
    dateWithdrawnToController.clear();
  }

  FilterManageWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterManageWithdrawnInvoicesEntity()
      ..statusNotifier.value = this.statusNotifier.value
      ..selectedUserSales.value = this.selectedUserSales.value
      ..withDrawnUser.value = this.withDrawnUser.value
      ..branchNotifier.value = List.of(this.branchNotifier.value)
      ..sortAsc.value = this.sortAsc.value
      ..dateApproveFromController.text = this.dateApproveFromController.text
      ..dateApproveToController.text = this.dateApproveToController.text
      ..dateWithdrawnFromController.text = this.dateWithdrawnFromController.text
      ..dateWithdrawnToController.text = this.dateWithdrawnToController.text;
  }

  FilterManageWithdrawnInvoicesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      statusNotifier,
      branchNotifier,
      selectedUserSales,
      withDrawnUser,
      sortAsc,
      dateApproveFromController,
      dateApproveToController,
      dateWithdrawnFromController,
      dateWithdrawnToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return statusNotifier.value != WithdrawalInvoiceStatusEnum.user ||
        branchNotifier.value.isNotEmpty ||
        selectedUserSales.value != null ||
        withDrawnUser.value != null ||
        dateApproveFromController.text.isNotEmpty ||
        dateApproveToController.text.isNotEmpty ||
        dateWithdrawnFromController.text.isNotEmpty ||
        dateWithdrawnToController.text.isNotEmpty;
  }
}
