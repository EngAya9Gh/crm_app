import 'package:flutter/material.dart';

import '../../../../../model/usermodel.dart';

class FilterDelayAfterInstallEntity {
  FilterDelayAfterInstallEntity() {
    dateFromController.addListener(() {
      dateFromNotifier.value = dateFromController.text;
    });
    dateToController.addListener(() {
      dateToNotifier.value = dateToController.text;
    });
  }

  ValueNotifier<UserModel?> employeeNotifier = ValueNotifier<UserModel?>(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  ValueNotifier<String> dateFromNotifier = ValueNotifier<String>('');
  ValueNotifier<String> dateToNotifier = ValueNotifier<String>('');

  void clearFilters() {
    employeeNotifier.value = null;
    dateFromController.clear();
    dateToController.clear();
  }

  FilterDelayAfterInstallEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDelayAfterInstallEntity()
      ..employeeNotifier.value = this.employeeNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterDelayAfterInstallEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      employeeNotifier,
      dateFromNotifier,
      dateToNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return employeeNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
