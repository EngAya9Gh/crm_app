import 'package:flutter/material.dart';

import '../../../../../model/maincitymodel.dart';

class FilterSupportClientsInvoicesEntity {
  FilterSupportClientsInvoicesEntity();

  int allRegionsCount = 0;
  int allCitiesCount = 0;

  ValueNotifier<List<CityModel>> citiesNotifier = ValueNotifier([]);
  ValueNotifier<List<MainCityModel>> regionsNotifier = ValueNotifier([]);
  ValueNotifier<String?> statusNotifier = ValueNotifier(null);

  void clear() {
    citiesNotifier.value.clear();
    regionsNotifier.value.clear();
    statusNotifier.value = null;
  }

  FilterSupportClientsInvoicesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterSupportClientsInvoicesEntity()
      ..citiesNotifier.value = citiesNotifier.value
      ..regionsNotifier.value = regionsNotifier.value
      ..statusNotifier.value = statusNotifier.value;
  }

  FilterSupportClientsInvoicesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clear();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      citiesNotifier,
      regionsNotifier,
      statusNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return citiesNotifier.value.length != allCitiesCount ||
        regionsNotifier.value.length != allRegionsCount ||
        statusNotifier.value != null;
  }
}
