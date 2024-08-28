import 'package:flutter/material.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';

class FilterManageWithdrawnInvoicesEntity {
  FilterManageWithdrawnInvoicesEntity();

  ValueNotifier<WithdrawalInvoiceStatusEnum> statusNotifier =
      ValueNotifier<WithdrawalInvoiceStatusEnum>(
          WithdrawalInvoiceStatusEnum.user);

  void clearFilters() {
    statusNotifier.value = WithdrawalInvoiceStatusEnum.user;
  }

  FilterManageWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterManageWithdrawnInvoicesEntity()
      ..statusNotifier.value = this.statusNotifier.value;
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
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return statusNotifier.value != WithdrawalInvoiceStatusEnum.user;
  }
}
