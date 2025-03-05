import 'package:flutter/material.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/usermodel.dart';

class FilterManageWithdrawnInvoicesEntity {
  FilterManageWithdrawnInvoicesEntity();

  ValueNotifier<WithdrawalInvoiceStatusEnum> statusNotifier = ValueNotifier<WithdrawalInvoiceStatusEnum>(WithdrawalInvoiceStatusEnum.user);
  ValueNotifier<BranchModel?> branchNotifier = ValueNotifier<BranchModel?>(null);
  final ValueNotifier<UserEntity?> selectedUserSales = ValueNotifier(null);
  final ValueNotifier<UserModel?> withDrawnUser = ValueNotifier(null);

  void clearFilters() {
    statusNotifier.value = WithdrawalInvoiceStatusEnum.user;
    branchNotifier.value = null;
    selectedUserSales.value = null;
    withDrawnUser.value = null;
  }

  FilterManageWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterManageWithdrawnInvoicesEntity()
      ..statusNotifier.value = this.statusNotifier.value
      ..selectedUserSales.value = this.selectedUserSales.value
      ..withDrawnUser.value = this.withDrawnUser.value
      ..branchNotifier.value = this.branchNotifier.value;
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
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return statusNotifier.value != WithdrawalInvoiceStatusEnum.user ||
        branchNotifier.value != null ||
        selectedUserSales.value != null ||
        withDrawnUser.value != null;
  }
}
