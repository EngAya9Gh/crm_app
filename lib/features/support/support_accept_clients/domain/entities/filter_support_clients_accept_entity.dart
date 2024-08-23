import 'package:flutter/material.dart';

import '../../../../../core/common/models/location/region_model.dart';

class FilterSupportClientsAcceptEntity {
  FilterSupportClientsAcceptEntity();

  ValueNotifier<List<RegionModel>?> fkMainCitiesNotifier =
      ValueNotifier<List<RegionModel>?>(null);

  void clearFilters() {
    fkMainCitiesNotifier.value = null;
  }

  FilterSupportClientsAcceptEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterSupportClientsAcceptEntity()
      ..fkMainCitiesNotifier.value = this.fkMainCitiesNotifier.value;
  }

  FilterSupportClientsAcceptEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      fkMainCitiesNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return fkMainCitiesNotifier.value != null;
  }
}
