import 'package:flutter/material.dart';


class RecommendedClientsReportsEntity {
  RecommendedClientsReportsEntity();

  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    dateFromController.clear();
    dateToController.clear();
  }

  RecommendedClientsReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = RecommendedClientsReportsEntity()
      ..dateFromController.text = dateFromController.text
      ..dateToController.text = dateToController.text;
  }

  RecommendedClientsReportsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    _changeValuesToNotifyListeners();

    return _previousState!..savePreviousState();
  }

  void _changeValuesToNotifyListeners() {
    this.dateFromController.text = _previousState!.dateFromController.text;
    this.dateToController.text = _previousState!.dateToController.text;
  }

  Iterable<Listenable?> listenables() {
    return [
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return dateFromController.text.isNotEmpty || dateToController.text.isNotEmpty;
  }
}
