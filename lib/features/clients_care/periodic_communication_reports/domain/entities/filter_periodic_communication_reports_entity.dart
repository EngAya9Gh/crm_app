import 'package:flutter/material.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';

class FilterPeriodicCommunicationReportsEntity {
  FilterPeriodicCommunicationReportsEntity();

  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();

  TextEditingController get dateFromController => _dateFromController;

  TextEditingController get dateToController => _dateToController;

  set setDateFromControllerValue(String? value) {
    if (value != null) _dateFromController.text = value;
  }

  set setDateToControllerValue(String? value) {
    if (value != null) _dateToController.text = value;
  }

  void clearFilters() {
    _dateFromController.clear();
    setDateFromControllerValue = HelperFunctions.formatDate(DateTime.now());
    setDateToControllerValue = HelperFunctions.formatDate(DateTime.now());
  }

  FilterPeriodicCommunicationReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPeriodicCommunicationReportsEntity()
      ..dateFromController.text = dateFromController.text
      ..dateToController.text = dateToController.text;
  }

  FilterPeriodicCommunicationReportsEntity get returnToPreviousState {
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
    return dateFromController.text !=
            HelperFunctions.formatDate(DateTime.now()) ||
        dateToController.text != HelperFunctions.formatDate(DateTime.now());
  }
}
