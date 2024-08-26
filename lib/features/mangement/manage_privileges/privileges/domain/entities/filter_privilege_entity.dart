import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/privilege_type_enum.dart';

class FilterPrivilegeEntity {
  FilterPrivilegeEntity();

  ValueNotifier<PrivilegeTypeEnum?> privilegeType =
      ValueNotifier<PrivilegeTypeEnum?>(null);

  void clearFilters() {
    privilegeType.value = null;
  }

  FilterPrivilegeEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterPrivilegeEntity()
      ..privilegeType.value = this.privilegeType.value;
  }

  FilterPrivilegeEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }

    _changeValuesToNotifyListeners();

    return _previousState!..savePreviousState();
  }

  void _changeValuesToNotifyListeners() {
    this.privilegeType.value = _previousState!.privilegeType.value;
  }

  Iterable<Listenable?> listenables() {
    return [
      privilegeType,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return privilegeType.value != null;
  }
}
