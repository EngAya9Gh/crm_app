import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../model/usermodel.dart';

class FilterInstallQualityEntity {
  FilterInstallQualityEntity();

  ValueNotifier<UserModel?> employeeNotifier = ValueNotifier<UserModel?>(null);
  ValueNotifier<bool> isMyClientsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<BranchModel?> regionIdNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<String?> statusNotifier = ValueNotifier<String?>(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    employeeNotifier.value = null;
    isMyClientsNotifier.value = false;
    userIdNotifier.value = null;
    regionIdNotifier.value = null;
    statusNotifier.value = null;
    dateFromController.clear();
    dateToController.clear();
  }

  FilterInstallQualityEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterInstallQualityEntity()
      ..employeeNotifier.value = this.employeeNotifier.value
      ..isMyClientsNotifier.value = this.isMyClientsNotifier.value
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionIdNotifier.value = this.regionIdNotifier.value
      ..statusNotifier.value = this.statusNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterInstallQualityEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      employeeNotifier,
      isMyClientsNotifier,
      userIdNotifier,
      regionIdNotifier,
      statusNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return employeeNotifier.value != null ||
        isMyClientsNotifier.value ||
        userIdNotifier.value != null ||
        regionIdNotifier.value != null ||
        statusNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
