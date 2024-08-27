import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/communication/greeting_type_enum.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/models/location/branch_model.dart';

class FilterGreetingCommunicationEntity {
  FilterGreetingCommunicationEntity();

  ValueNotifier<bool> isMyClientsNotifier = ValueNotifier<bool>(false);
  ValueNotifier<String?> userIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<BranchModel?> regionIdNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<GreetingTypeEnum?> statusNotifier =
      ValueNotifier<GreetingTypeEnum?>(null);

  TextEditingController dateFromController = TextEditingController(
    text: HelperFunctions.formatDate(DateTime.now()),
  );
  TextEditingController dateToController = TextEditingController(
    text: HelperFunctions.formatDate(DateTime.now()),
  );

  void clearFilters() {
    isMyClientsNotifier.value = false;
    userIdNotifier.value = null;
    regionIdNotifier.value = null;
    statusNotifier.value = null;
    dateFromController = TextEditingController(
      text: HelperFunctions.formatDate(DateTime.now()),
    );
    dateToController = TextEditingController(
      text: HelperFunctions.formatDate(DateTime.now()),
    );
  }

  FilterGreetingCommunicationEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterGreetingCommunicationEntity()
      ..isMyClientsNotifier.value = this.isMyClientsNotifier.value
      ..userIdNotifier.value = this.userIdNotifier.value
      ..regionIdNotifier.value = this.regionIdNotifier.value
      ..statusNotifier.value = this.statusNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
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
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return isMyClientsNotifier.value ||
        userIdNotifier.value != null ||
        regionIdNotifier.value != null ||
        statusNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
