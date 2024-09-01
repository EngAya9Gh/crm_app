import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterWrongNumbersEntity {
  FilterWrongNumbersEntity();

  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<BranchModel?> regionIdNotifier =
      ValueNotifier<BranchModel?>(null);

  void clearFilters() {
    userIdNotifier.value = null;
    regionIdNotifier.value = null;
  }

  FilterWrongNumbersEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterWrongNumbersEntity()
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionIdNotifier.value = this.regionIdNotifier.value;
  }

  FilterWrongNumbersEntity get returnToPreviousState {
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
