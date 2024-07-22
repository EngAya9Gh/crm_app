import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/regoin_model.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../../manage_privilege/data/models/privilege_model.dart';

class FilterUsersEntity {
  final ValueNotifier<List<PrivilegeModel>> privilegesNotifier =
      ValueNotifier([]);
  final ValueNotifier<RegionModel?> fkRegionNotifier =
      ValueNotifier<RegionModel?>(null);
  final ValueNotifier<ActiveStateEnum?> isActiveNotifier = ValueNotifier(null);
  final ValueNotifier<ManageModel?> manageNotifier = ValueNotifier(null);
  final ValueNotifier<LevelModel?> levelNotifier = ValueNotifier(null);

  void clearFilters() {
    privilegesNotifier.value = [];
    fkRegionNotifier.value = null;
    isActiveNotifier.value = null;
    manageNotifier.value = null;
    levelNotifier.value = null;
  }

  FilterUsersEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterUsersEntity()
      ..privilegesNotifier.value = this.privilegesNotifier.value
      ..fkRegionNotifier.value = this.fkRegionNotifier.value
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
      fkRegionNotifier,
      isActiveNotifier,
      manageNotifier,
      levelNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return privilegesNotifier.value.isNotEmpty ||
        fkRegionNotifier.value != null ||
        isActiveNotifier.value != null ||
        manageNotifier.value != null ||
        levelNotifier.value != null;
  }
}
