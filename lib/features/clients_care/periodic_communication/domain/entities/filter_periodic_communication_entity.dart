import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterPeriodicCommunicationEntity {
  FilterPeriodicCommunicationEntity();

  ValueNotifier<bool> isMyClientsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<double?> rateNotifier = ValueNotifier<double?>(null);
  ValueNotifier<BranchModel?> regionNotifier =
      ValueNotifier<BranchModel?>(null);

  TextEditingController dateFromController = TextEditingController(
    text: HelperFunctions.formatDate(DateTime.now()),
  );
  TextEditingController dateToController = TextEditingController(
    text: HelperFunctions.formatDate(DateTime.now()),
  );

  void clearFilters() {
    isMyClientsNotifier.value = false;
    userIdNotifier.value = null;
    regionNotifier.value = null;
    rateNotifier.value = null;
    dateFromController = TextEditingController(
      text: HelperFunctions.formatDate(DateTime.now()),
    );
    dateToController = TextEditingController(
      text: HelperFunctions.formatDate(DateTime.now()),
    );
  }

  FilterPeriodicCommunicationEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPeriodicCommunicationEntity()
      ..isMyClientsNotifier.value = this.isMyClientsNotifier.value
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionNotifier.value = this.regionNotifier.value
      ..rateNotifier.value = this.rateNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterPeriodicCommunicationEntity get returnToPreviousState {
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
      regionNotifier,
      rateNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return isMyClientsNotifier.value ||
        userIdNotifier.value != null ||
        regionNotifier.value != null ||
        rateNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
