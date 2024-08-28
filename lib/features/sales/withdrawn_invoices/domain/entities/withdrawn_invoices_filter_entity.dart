import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterWithdrawnInvoicesEntity {
  FilterWithdrawnInvoicesEntity();

  ValueNotifier<BranchModel?> branchNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    branchNotifier.value = null;
  }

  FilterWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterWithdrawnInvoicesEntity()
      ..branchNotifier.value = this.branchNotifier.value;
  }

  FilterWithdrawnInvoicesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      branchNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return branchNotifier.value != null;
  }
}
