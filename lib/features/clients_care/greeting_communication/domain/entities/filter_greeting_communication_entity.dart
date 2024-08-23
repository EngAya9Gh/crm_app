import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterGreetingCommunicationEntity {
  FilterGreetingCommunicationEntity();

  ValueNotifier<bool> isMyClientsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<BranchModel?> regionIdNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<String?> statusNotifier = ValueNotifier<String?>(null);

  void clearFilters() {
    isMyClientsNotifier.value = false;
    userIdNotifier.value = null;
    regionIdNotifier.value = null;
    statusNotifier.value = null;
  }

  FilterGreetingCommunicationEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterGreetingCommunicationEntity()
      ..isMyClientsNotifier.value = this.isMyClientsNotifier.value
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionIdNotifier.value = this.regionIdNotifier.value
      ..statusNotifier.value = this.statusNotifier.value;
  }

  FilterGreetingCommunicationEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      isMyClientsNotifier,
      userIdNotifier,
      regionIdNotifier,
      statusNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return isMyClientsNotifier.value ||
        userIdNotifier.value != null ||
        regionIdNotifier.value != null ||
        statusNotifier.value != null;
  }
}
