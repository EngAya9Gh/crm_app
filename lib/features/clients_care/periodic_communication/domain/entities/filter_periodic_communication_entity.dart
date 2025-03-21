import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../../../core/common/models/location/branch_model.dart';

class FilterPeriodicCommunicationEntity {
  FilterPeriodicCommunicationEntity();

  ValueNotifier<bool> isMyClientsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> isClientWhoNotRate = ValueNotifier<bool>(false);
  ValueNotifier<bool> showAllRates = ValueNotifier<bool>(true);
  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<double?> rateNotifier = ValueNotifier<double?>(null);
  ValueNotifier<PeriodicCommunicationClientTypeEnum?> type = ValueNotifier<PeriodicCommunicationClientTypeEnum?>(null);
  ValueNotifier<BranchModel?> regionNotifier = ValueNotifier<BranchModel?>(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    isMyClientsNotifier.value = false;
    isClientWhoNotRate.value = false;
    showAllRates.value = false;
    userIdNotifier.value = null;
    regionNotifier.value = null;
    rateNotifier.value = null;
    dateFromController = TextEditingController();
    dateToController = TextEditingController();
  }

  FilterPeriodicCommunicationEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPeriodicCommunicationEntity()
      ..isMyClientsNotifier.value = this.isMyClientsNotifier.value
      ..isClientWhoNotRate.value = this.isClientWhoNotRate.value
      ..showAllRates.value = this.showAllRates.value
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
      isClientWhoNotRate,
      showAllRates,
      userIdNotifier,
      regionNotifier,
      rateNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return isMyClientsNotifier.value ||
        isClientWhoNotRate.value ||
        showAllRates.value ||
        userIdNotifier.value != null ||
        regionNotifier.value != null ||
        rateNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
