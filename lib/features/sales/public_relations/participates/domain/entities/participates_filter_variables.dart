import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/common/models/location/city_model.dart';

class ParticipatesFilterVariables {
  ParticipatesFilterVariables();

  ValueNotifier<CityModel?> selectedCity = ValueNotifier(null);
  ValueNotifier<StateParticipateEnum?> stateParticipate = ValueNotifier(null);

  void clear() {
    selectedCity = ValueNotifier(null);
    stateParticipate = ValueNotifier(null);
    _previousFilter = null;
  }

  Iterable<Listenable?> listenables() {
    return [
      selectedCity,
      stateParticipate,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return selectedCity.value != null || stateParticipate.value != null;
  }

  ParticipatesFilterVariables? _previousFilter;

  void savePreviousState() {
    _previousFilter = ParticipatesFilterVariables()
      ..selectedCity.value = this.selectedCity.value
      ..stateParticipate.value = this.stateParticipate.value;
  }

  ParticipatesFilterVariables get loadPreviousState {
    if (_previousFilter == null) {
      this.clear();
      return this;
    }
    return _previousFilter!..savePreviousState();
  }
}
