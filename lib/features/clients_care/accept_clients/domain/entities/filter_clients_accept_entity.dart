import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterClientsAcceptEntity {
  FilterClientsAcceptEntity();

  ValueNotifier<BranchModel?> fkRegionNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    fkRegionNotifier.value = null;
  }

  FilterClientsAcceptEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsAcceptEntity()
      ..fkRegionNotifier.value = this.fkRegionNotifier.value;
  }

  FilterClientsAcceptEntity get returnToPreviousState {
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
