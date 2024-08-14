import 'package:flutter/material.dart';

class FilterExceededClientsEntity {
  FilterExceededClientsEntity();

  ValueNotifier<bool> passLimitNotifier = ValueNotifier<bool>(false);

  void clearFilters() {
    passLimitNotifier.value = false;
  }

  FilterExceededClientsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterExceededClientsEntity()
      ..passLimitNotifier.value = this.passLimitNotifier.value;
  }

  FilterExceededClientsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      passLimitNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return passLimitNotifier.value;
  }
}
