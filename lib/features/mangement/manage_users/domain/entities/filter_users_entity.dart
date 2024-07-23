import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../model/managmodel.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../../manage_privilege/data/models/privilege_model.dart';
import '../../data/models/branch_model.dart';

class FilterUsersEntity {
  final ValueNotifier<List<PrivilegeModel>> privilegesNotifier =
      ValueNotifier([]);
  final ValueNotifier<BranchModel?> branchNotifier = ValueNotifier(null);
  final ValueNotifier<ActiveStateEnum?> isActiveNotifier = ValueNotifier(null);
  final ValueNotifier<ManageModel?> manageNotifier = ValueNotifier(null);
  final ValueNotifier<LevelModel?> levelNotifier = ValueNotifier(null);

  // var branchNotifier;

  void clearFilters() {
    privilegesNotifier.value = [];
    branchNotifier.value = null;
    isActiveNotifier.value = null;
    manageNotifier.value = null;
    levelNotifier.value = null;
  }

  FilterUsersEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterUsersEntity()
      ..privilegesNotifier.value = this.privilegesNotifier.value
      ..branchNotifier.value = this.branchNotifier.value
      ..isActiveNotifier.value = this.isActiveNotifier.value
      ..manageNotifier.value = this.manageNotifier.value
      ..levelNotifier.value = this.levelNotifier.value;
  }

  FilterUsersEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }

    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      privilegesNotifier,
      branchNotifier,
      isActiveNotifier,
      manageNotifier,
      levelNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return privilegesNotifier.value.isNotEmpty ||
        branchNotifier.value != null ||
        isActiveNotifier.value != null ||
        manageNotifier.value != null ||
        levelNotifier.value != null;
  }
}
