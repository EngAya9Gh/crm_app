import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:flutter/material.dart';

import '../../../../../model/usermodel.dart';

class FilterDemandEntity {
  FilterDemandEntity();

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  int currentPage = 1;
  final int limit = 10;
  final ValueNotifier<UserModel?> selectedUsers = ValueNotifier(null);
  final ValueNotifier<ManageModel?> selectedManagment = ValueNotifier(null);
  final ValueNotifier<DemandVersionStatus?> selectedStatus = ValueNotifier(null);

  void clearFilters() {
    selectedStatus.value = null;
    selectedUsers.value = null;
    selectedManagment.value = null;
    currentPage = 1;
    fromController.clear();
    toController.clear();
  }

  FilterDemandEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDemandEntity()
      ..selectedUsers.value = this.selectedUsers.value
      ..selectedStatus.value = this.selectedStatus.value
      ..selectedManagment.value = this.selectedManagment.value
      ..fromController.text = this.fromController.text
      ..toController.text = this.toController.text;
  }

  FilterDemandEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      selectedUsers,
      selectedManagment,
      selectedStatus,
      fromController,
      toController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return selectedStatus.value != null ||
        selectedUsers.value != null ||
        selectedManagment.value != null ||
        fromController.text.isNotEmpty ||
        toController.text.isNotEmpty;
  }
}
