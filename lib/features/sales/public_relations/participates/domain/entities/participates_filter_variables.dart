import 'package:flutter/material.dart';

import '../../../../../../model/maincitymodel.dart';

class ParticipatesFilterVariables {
  ParticipatesFilterVariables();

  CityModel? selectedCity;
  TextEditingController searchTextField = TextEditingController();
  String? stateParticipate;

  void clear() {
    selectedCity = null;
    searchTextField.clear();
    stateParticipate = null;
  }
}
