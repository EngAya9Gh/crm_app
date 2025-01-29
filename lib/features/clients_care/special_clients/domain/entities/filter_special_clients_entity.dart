import 'package:crm_smart/core/common/models/location/city_model.dart';
import 'package:flutter/material.dart';

class FilterSpecialClientsEntity {
  FilterSpecialClientsEntity();

  ValueNotifier<CityModel?> cityNotifier = ValueNotifier<CityModel?>(null);
  ValueNotifier<int> currentPage = ValueNotifier(1);

  void clearFilters() {
    cityNotifier.value = null;
    currentPage.value = 1;
  }

  FilterSpecialClientsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterSpecialClientsEntity()
      ..cityNotifier.value = this.cityNotifier.value
      ..currentPage.value = this.currentPage.value;
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
      currentPage,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return cityNotifier.value != null;
  }
}
