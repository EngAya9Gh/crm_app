import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/branch_model.dart';

class FilterDeletedInvoicesEntity {
  FilterDeletedInvoicesEntity();

  ValueNotifier<BranchModel?> branchNotifier =
      ValueNotifier<BranchModel?>(null);
  ValueNotifier<UserEntity?> userNotifier = ValueNotifier<UserEntity?>(null);

  void clearFilters() {
    branchNotifier.value = null;
    userNotifier.value = null;
  }

  FilterDeletedInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDeletedInvoicesEntity()
      ..branchNotifier.value = this.branchNotifier.value
      ..userNotifier.value = this.userNotifier.value;
  }

  FilterDeletedInvoicesEntity get returnToPreviousState {
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
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return branchNotifier.value != null || userNotifier.value != null;
  }
}
