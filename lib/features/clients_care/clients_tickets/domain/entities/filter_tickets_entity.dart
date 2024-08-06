import 'package:flutter/material.dart';

class FilterTicketsEntity {
  FilterTicketsEntity();

  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    dateFromController.clear();
    dateToController.clear();
  }

  FilterTicketsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterTicketsEntity()
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterTicketsEntity get returnToPreviousState {
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
