import 'package:flutter/material.dart';

class FilterClientLogsEntity {
  FilterClientLogsEntity();

  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    dateFromController.text = '';
    dateToController.text = '';
  }

  FilterClientLogsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientLogsEntity()
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
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
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
