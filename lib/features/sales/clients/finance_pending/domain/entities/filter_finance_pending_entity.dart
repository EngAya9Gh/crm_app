import 'package:flutter/material.dart';

class FilterFinancePendingEntity {
  FilterFinancePendingEntity();

  void clearFilters() {}

  FilterFinancePendingEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterFinancePendingEntity();
  }

  FilterFinancePendingEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [];
  }

  bool checkIfFilterIsNotEmpty() {
    return false;
  }
}
