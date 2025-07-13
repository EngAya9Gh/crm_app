import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';

class FilterEvaluationLevelReportEntity {
  FilterEvaluationLevelReportEntity();

  ValueNotifier<double?> rateNotifier = ValueNotifier<double?>(null);
  TextEditingController dateFromController = TextEditingController(
    text: HelperFunctions.formatDate(_startOfTheMonth),
  );
  TextEditingController dateToController = TextEditingController(
    text: HelperFunctions.formatDate(_endOfTheMonth),
  );
  TextEditingController searchController = TextEditingController();
  void clearFilters() {
    rateNotifier.value = null;
    searchController = TextEditingController();
    dateFromController.text = HelperFunctions.formatDate(_startOfTheMonth);
    dateToController.text = HelperFunctions.formatDate(_endOfTheMonth);
  }

  FilterEvaluationLevelReportEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterEvaluationLevelReportEntity()
      ..rateNotifier.value = this.rateNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..searchController.text = this.searchController.text
      ..dateToController.text = this.dateToController.text;

  }

  FilterEvaluationLevelReportEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }

    _changeValuesToNotifyListeners();

    return _previousState!..savePreviousState();
  }

  void _changeValuesToNotifyListeners() {
    this.rateNotifier.value = _previousState!.rateNotifier.value;
    this.dateFromController.text = _previousState!.dateFromController.text;
    this.dateToController.text = _previousState!.dateToController.text;
  }

  Iterable<Listenable?> listenables() {
    return [
      rateNotifier,
      dateFromController,
      dateToController,
      searchController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return rateNotifier.value != null ||
        dateFromController.text !=
            HelperFunctions.formatDate(_startOfTheMonth) ||
        dateToController.text != HelperFunctions.formatDate(_endOfTheMonth);
  }

  static DateTime get _now => DateTime.now();

  static DateTime get _startOfTheMonth => DateTime(_now.year, _now.month, 1);

  static DateTime get _endOfTheMonth => DateTime(_now.year, _now.month + 1, 0);
}
