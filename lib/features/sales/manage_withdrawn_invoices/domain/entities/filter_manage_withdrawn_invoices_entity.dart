import 'package:flutter/material.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';

class FilterManageWithdrawnInvoicesEntity {
  FilterManageWithdrawnInvoicesEntity();

  ValueNotifier<WithdrawalInvoiceStatusEnum> statusNotifier =
      ValueNotifier<WithdrawalInvoiceStatusEnum>(
          WithdrawalInvoiceStatusEnum.user);
  ValueNotifier<BranchModel?> branchNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    statusNotifier.value = WithdrawalInvoiceStatusEnum.user;
    branchNotifier.value = null;
  }

  FilterManageWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterManageWithdrawnInvoicesEntity()
      ..statusNotifier.value = this.statusNotifier.value
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
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return statusNotifier.value != WithdrawalInvoiceStatusEnum.user ||
        branchNotifier.value != null;
  }
}
