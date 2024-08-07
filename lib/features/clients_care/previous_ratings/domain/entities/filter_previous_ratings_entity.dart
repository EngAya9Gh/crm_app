import 'package:flutter/material.dart';

import '../../../../../core/common/models/user_entity.dart';

class FilterPreviousRatingsEntity {
  FilterPreviousRatingsEntity();

  ValueNotifier<UserEntity?> careEmployeeNotifier =
      ValueNotifier<UserEntity?>(null); //userInstall
  ValueNotifier<UserEntity?> supportEmployeeNotifier =
      ValueNotifier<UserEntity?>(null); //fkUser
  ValueNotifier<bool> starClientNotifier = ValueNotifier<bool>(false);

  void clearFilters() {
    careEmployeeNotifier.value = null;
    supportEmployeeNotifier.value = null;
    starClientNotifier.value = false;
  }

  FilterPreviousRatingsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPreviousRatingsEntity()
      ..careEmployeeNotifier.value = this.careEmployeeNotifier.value
      ..supportEmployeeNotifier.value = this.supportEmployeeNotifier.value
      ..starClientNotifier.value = this.starClientNotifier.value;
  }

  FilterPreviousRatingsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      careEmployeeNotifier,
      supportEmployeeNotifier,
      starClientNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return careEmployeeNotifier.value != null ||
        supportEmployeeNotifier.value != null ||
        starClientNotifier.value;
  }
}
