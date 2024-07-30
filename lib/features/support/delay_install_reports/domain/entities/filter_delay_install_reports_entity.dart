import 'package:flutter/material.dart';

import '../../../../../model/usermodel.dart';

class FilterDelayInstallReportsEntity {
  FilterDelayInstallReportsEntity();

  ValueNotifier<UserModel?> employeeNotifier = ValueNotifier<UserModel?>(null);

  void clearFilters() {
    employeeNotifier.value = null;
  }

  FilterDelayInstallReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDelayInstallReportsEntity()
      ..employeeNotifier.value = this.employeeNotifier.value;
  }

  FilterDelayInstallReportsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      employeeNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return employeeNotifier.value != null;
  }
}
