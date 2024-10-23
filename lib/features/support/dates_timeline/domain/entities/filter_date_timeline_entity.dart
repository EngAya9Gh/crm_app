import 'package:flutter/material.dart';

import '../../../../../model/usermodel.dart';

class FilterDatesTimelineEntity {
  FilterDatesTimelineEntity();

  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);

  void clear() {
    userNotifier.value = null;
  }

  FilterDatesTimelineEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDatesTimelineEntity()
      ..userNotifier.value = userNotifier.value;
  }

  FilterDatesTimelineEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clear();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [userNotifier];
  }

  bool checkIfFilterIsNotEmpty() {
    return userNotifier.value != null;
  }
}