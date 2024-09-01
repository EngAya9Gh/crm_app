import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/user_entity.dart';

class FilterWithdrawnInvoicesEntity {
  FilterWithdrawnInvoicesEntity();

  ValueNotifier<BranchModel?> branchNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<UserEntity?> userNotifier = ValueNotifier<UserEntity?>(null);

  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    branchNotifier.value = null;
    userNotifier.value = null;
    dateFromController.text = '';
    dateToController.text = '';
  }

  FilterWithdrawnInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterWithdrawnInvoicesEntity()
      ..branchNotifier.value = this.branchNotifier.value
      ..userNotifier.value = this.userNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterWithdrawnInvoicesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      branchNotifier,
      userNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return branchNotifier.value != null ||
        userNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
