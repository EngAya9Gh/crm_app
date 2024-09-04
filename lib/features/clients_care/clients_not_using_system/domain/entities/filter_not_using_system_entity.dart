import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterNotUsingSystemEntity {
  FilterNotUsingSystemEntity();

  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<BranchModel?> regionIdNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    userIdNotifier.value = null;
    regionIdNotifier.value = null;
  }

  FilterNotUsingSystemEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterNotUsingSystemEntity()
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionIdNotifier.value = this.regionIdNotifier.value;
  }

  FilterNotUsingSystemEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      userIdNotifier,
      regionIdNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return userIdNotifier.value != null || regionIdNotifier.value != null;
  }
}
