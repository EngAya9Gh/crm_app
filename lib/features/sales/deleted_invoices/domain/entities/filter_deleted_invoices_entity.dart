import 'package:crm_smart/core/common/models/location/city_model.dart';
import 'package:flutter/material.dart';

class FilterSpecialClientsEntity {
  FilterSpecialClientsEntity();

  ValueNotifier<CityModel?> cityNotifier = ValueNotifier<CityModel?>(null);

  void clearFilters() {
    cityNotifier.value = null;
  }

  FilterSpecialClientsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterSpecialClientsEntity()
      ..cityNotifier.value = this.cityNotifier.value;
  }

  FilterSpecialClientsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      cityNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return cityNotifier.value != null;
  }
}
