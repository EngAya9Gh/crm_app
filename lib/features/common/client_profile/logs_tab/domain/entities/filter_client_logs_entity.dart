import 'package:flutter/material.dart';

class FilterClientLogsEntity {
  FilterClientLogsEntity();

  TextEditingController dateFromController = TextEditingController();

  void clearFilters() {
    dateFromController.text = '';
  }

  FilterClientLogsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientLogsEntity()
      ..dateFromController.text = this.dateFromController.text;
  }

  FilterClientLogsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      dateFromController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return dateFromController.text.isNotEmpty;
  }
}
