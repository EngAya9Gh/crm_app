import 'package:flutter/material.dart';

import '../../../../../../core/common/models/location/branch_model.dart';

class FilterPendingInvoicesEntity {
  FilterPendingInvoicesEntity();

  ValueNotifier<BranchModel?> regionNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    regionNotifier.value = null;
  }

  FilterPendingInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPendingInvoicesEntity()
      ..regionNotifier.value = this.regionNotifier.value;
  }

  FilterPendingInvoicesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      regionNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return regionNotifier.value != null;
  }
}
