import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';

class FilterClientsCareReportsEntity {
  FilterClientsCareReportsEntity() {
    changeDateAccordingToPeriod();
    _initListeners();
  }

  ValueNotifier<ReportTypeEnum> _reportTypeNotifier =
      ValueNotifier<ReportTypeEnum>(ReportTypeEnum.dateYear);
  ValueNotifier<PeriodTypeEnum> _periodTypeNotifier =
      ValueNotifier<PeriodTypeEnum>(PeriodTypeEnum.yearly);
  ValueNotifier<CareReportTypeEnum> _typeCareNotifier =
      ValueNotifier<CareReportTypeEnum>(CareReportTypeEnum.welcome);
  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();

  ValueNotifier<ReportTypeEnum> get reportTypeNotifier => _reportTypeNotifier;

  ValueNotifier<PeriodTypeEnum> get periodTypeNotifier => _periodTypeNotifier;

  ValueNotifier<CareReportTypeEnum?> get typeCareNotifier => _typeCareNotifier;

  TextEditingController get dateFromController => _dateFromController;

  TextEditingController get dateToController => _dateToController;

  set setReportTypeNotifierValue(ReportTypeEnum? value) {
    if (value != null) _reportTypeNotifier.value = value;
  }

  set setPeriodTypeNotifierValue(PeriodTypeEnum? value) {
    if (value != null) _periodTypeNotifier.value = value;
  }

  set setTypeCareNotifierValue(CareReportTypeEnum? value) {
    if (value != null) _typeCareNotifier.value = value;
  }

  set setDateFromControllerValue(String? value) {
    if (value != null) _dateFromController.text = value;
  }

  set setDateToControllerValue(String? value) {
    if (value != null) _dateToController.text = value;
  }

  void clearFilters() {
    reportTypeNotifier.value = ReportTypeEnum.dateYear;
    periodTypeNotifier.value = PeriodTypeEnum.yearly;
    typeCareNotifier.value = CareReportTypeEnum.welcome;
    _dateFromController.clear();
    setDateFromControllerValue = HelperFunctions.formatDate(DateTime.now());
    _dateToController.text = "";
  }

  FilterClientsCareReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsCareReportsEntity()
      ..reportTypeNotifier.value = reportTypeNotifier.value
      ..periodTypeNotifier.value = periodTypeNotifier.value
      ..typeCareNotifier.value = typeCareNotifier.value
      ..dateFromController.text = dateFromController.text
      ..dateToController.text = dateToController.text;
  }

  FilterClientsCareReportsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    _changeValuesToNotifyListeners();

    return _previousState!..savePreviousState();
  }

  void _changeValuesToNotifyListeners() {
    this.reportTypeNotifier.value = _previousState!.reportTypeNotifier.value;
    this.periodTypeNotifier.value = _previousState!.periodTypeNotifier.value;
    this.typeCareNotifier.value = _previousState!.typeCareNotifier.value;
    this.dateFromController.text = _previousState!.dateFromController.text;
    this.dateToController.text = _previousState!.dateToController.text;
  }

  Iterable<Listenable?> listenables() {
    return [
      reportTypeNotifier,
      periodTypeNotifier,
      typeCareNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return reportTypeNotifier.value != ReportTypeEnum.dateYear ||
        periodTypeNotifier.value != PeriodTypeEnum.yearly ||
        typeCareNotifier.value != CareReportTypeEnum.welcome ||
        dateFromController.text !=
            _formatDateAccordingToPeriod(
                HelperFunctions.formatDate(DateTime.now())) ||
        dateToController.text.isNotEmpty;
  }

  void _initListeners() {
    dateFromController.addListener(() {
      final String text = _formatDateAccordingToPeriod(dateFromController.text);
      dateFromController.text = text;
    });
    dateToController.addListener(() {
      final String text = _formatDateAccordingToPeriod(dateToController.text);
      dateToController.text = text;
    });
  }

  String _formatDateAccordingToPeriod(String date) {
    if (date.isEmpty) return date;

    final dateTime = _getDate(date);

    if (periodTypeNotifier.value == PeriodTypeEnum.monthly) {
      return "${dateTime.month}-${dateTime.year}";
    } else if (periodTypeNotifier.value == PeriodTypeEnum.yearly) {
      return "${dateTime.year}";
    }
    return HelperFunctions.formatDate(date);
  }

  void changeReportTypeAccordingToPeriod() {
    if (periodTypeNotifier.value == PeriodTypeEnum.daily) {
      reportTypeNotifier.value = ReportTypeEnum.dateDays;
    } else if (periodTypeNotifier.value == PeriodTypeEnum.monthly) {
      reportTypeNotifier.value = ReportTypeEnum.dateMonth;
    } else if (periodTypeNotifier.value == PeriodTypeEnum.yearly) {
      reportTypeNotifier.value = ReportTypeEnum.dateYear;
    }
  }

  void changeDateAccordingToPeriod() {
    if (periodTypeNotifier.value == PeriodTypeEnum.daily) {
      dateFromController.text = DateTime.now().toString();
      dateToController.text = DateTime.now().toString();
    } else if (periodTypeNotifier.value == PeriodTypeEnum.monthly) {
      dateFromController.text =
          "${DateTime.now().month}-${DateTime.now().year}";
    } else if (periodTypeNotifier.value == PeriodTypeEnum.yearly) {
      dateFromController.text = "${DateTime.now().year}";
    }
  }

  DateTime _getDate(String date) {
    if (date.isEmpty) {
      return DateTime.now();
    }
    // date from year only
    if (date.length == 4) {
      return DateTime(int.parse(date));
    }
    // date from month and year
    if (date.length <= 7) {
      final List<String> dateParts = date.split('-');
      return DateTime(int.parse(dateParts[1]), int.parse(dateParts[0]));
    }
    // date from day, month and year
    return HelperFunctions.dateFromString(date) ?? DateTime.now();
  }
}
