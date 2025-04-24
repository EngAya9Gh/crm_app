import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterElevationSysSupportEntity extends ChangeNotifier {
  FilterElevationSysSupportEntity();
  int page = 1;
  ValueNotifier<int> rateTypeNotifier = ValueNotifier<int>(1);
  ValueNotifier<double?> rateNotifier = ValueNotifier<double?>(null);
  TextEditingController searchController = TextEditingController();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  void clearFilters() {
    rateTypeNotifier.value = 1;
    rateNotifier.value = null;
    searchController = TextEditingController();
    dateFromController = TextEditingController();
    dateToController = TextEditingController();
    notifyListeners();
  }

  FilterElevationSysSupportEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterElevationSysSupportEntity()
      ..rateTypeNotifier.value = this.rateTypeNotifier.value
      ..rateNotifier.value = this.rateNotifier.value
      ..searchController.text = this.searchController.text
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
    notifyListeners();
  }

  FilterElevationSysSupportEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      notifyListeners();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      rateTypeNotifier,
      rateNotifier,
      searchController,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return rateNotifier.value != null || dateFromController.text.isNotEmpty || dateToController.text.isNotEmpty;
  }
}
