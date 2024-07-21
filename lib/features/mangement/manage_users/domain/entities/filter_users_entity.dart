import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/regoin_model.dart';
import '../../../manage_privilege/data/models/level_model.dart';

class FilterUsersEntity {
  final TextEditingController privilegeController = TextEditingController();

  final ValueNotifier<RegionModel?> fkRegionNotifier =
      ValueNotifier<RegionModel?>(null);

  final ValueNotifier<ActiveStateEnum?> isActiveNotifier = ValueNotifier(null);
  final ValueNotifier<ManageModel?> manageNotifier = ValueNotifier(null);
  final ValueNotifier<LevelModel?> levelNotifier = ValueNotifier(null);

  void clearFilters() {
    privilegeController.clear();
    fkRegionNotifier.value = null;
    isActiveNotifier.value = null;
    manageNotifier.value = null;
    levelNotifier.value = null;
  }

  FilterUsersEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterUsersEntity()
      ..privilegeController.text = this.privilegeController.text
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
      privilegeController,
      fkRegionNotifier,
      isActiveNotifier,
      manageNotifier,
      levelNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return privilegeController.text.isNotEmpty ||
        fkRegionNotifier.value != null ||
        isActiveNotifier.value != null ||
        manageNotifier.value != null ||
        levelNotifier.value != null;
  }
}
