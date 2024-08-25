import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterPrivilegesEntity {
  FilterPrivilegesEntity();

  ValueNotifier<BranchModel?> fkRegionNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    fkRegionNotifier.value = null;
  }

  FilterPrivilegesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPrivilegesEntity()
      ..fkRegionNotifier.value = this.fkRegionNotifier.value;
  }

  FilterPrivilegesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      fkRegionNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return fkRegionNotifier.value != null;
  }
}
