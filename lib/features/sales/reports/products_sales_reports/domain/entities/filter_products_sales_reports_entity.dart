import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../model/usermodel.dart';

class FilterProductsSalesReportsEntity {
  FilterProductsSalesReportsEntity() {
    changeDateAccordingToPeriod();
    _initListeners();
  }

  ValueNotifier<ReportTypeEnum> _reportTypeNotifier =
      ValueNotifier<ReportTypeEnum>(ReportTypeEnum.dateMonth);
  ValueNotifier<PeriodTypeEnum> _periodTypeNotifier =
      ValueNotifier<PeriodTypeEnum>(PeriodTypeEnum.monthly);
  ValueNotifier<ProductTypeEnum?> _productTypeNotifier =
      ValueNotifier<ProductTypeEnum?>(null);
  ValueNotifier<RegionModel?> _regionNotifier =
      ValueNotifier<RegionModel?>(null);
  ValueNotifier<UserModel?> _userNotifier = ValueNotifier<UserModel?>(null);

  ValueNotifier<bool> _isMarketingNotifier = ValueNotifier<bool>(false);
  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();

  ValueNotifier<ReportTypeEnum> get reportTypeNotifier => _reportTypeNotifier;

  ValueNotifier<PeriodTypeEnum> get periodTypeNotifier => _periodTypeNotifier;

  ValueNotifier<ProductTypeEnum?> get productTypeNotifier =>
      _productTypeNotifier;

  ValueNotifier<RegionModel?> get regionNotifier => _regionNotifier;

  ValueNotifier<UserModel?> get userNotifier => _userNotifier;

  ValueNotifier<bool> get isMarketingNotifier => _isMarketingNotifier;

  TextEditingController get dateFromController => _dateFromController;

  TextEditingController get dateToController => _dateToController;

  set setReportTypeNotifierValue(ReportTypeEnum? value) {
    if (value != null) _reportTypeNotifier.value = value;
  }

  set setPeriodTypeNotifierValue(PeriodTypeEnum? value) {
    if (value != null) _periodTypeNotifier.value = value;
  }

  set setProductTypeNotifierValue(ProductTypeEnum? value) {
    if (value != null) _productTypeNotifier.value = value;
  }

  set setRegionNotifierValue(RegionModel? value) {
    if (value != null) _regionNotifier.value = value;
  }

  set setUserNotifierValue(UserModel? value) {
    if (value != null) _userNotifier.value = value;
  }

  set setIsMarketingNotifierValue(bool? value) {
    if (value != null) _isMarketingNotifier.value = value;
  }

  set setDateFromControllerValue(String? value) {
    if (value != null) _dateFromController.text = value;
  }

  set setDateToControllerValue(String? value) {
    if (value != null) _dateToController.text = value;
  }

  void clearFilters() {
    reportTypeNotifier.value = ReportTypeEnum.dateMonth;
    periodTypeNotifier.value = PeriodTypeEnum.monthly;
    productTypeNotifier.value = null;
    regionNotifier.value = null;
    userNotifier.value = null;
    isMarketingNotifier.value = false;
    _dateFromController.clear();
    setDateFromControllerValue = HelperFunctions.formatDate(DateTime.now());
    _dateToController.clear();
  }

  FilterProductsSalesReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterProductsSalesReportsEntity()
      ..reportTypeNotifier.value = reportTypeNotifier.value
      ..periodTypeNotifier.value = periodTypeNotifier.value
      ..productTypeNotifier.value = productTypeNotifier.value
      ..regionNotifier.value = regionNotifier.value
      ..userNotifier.value = userNotifier.value
      ..isMarketingNotifier.value = isMarketingNotifier.value
      ..dateFromController.text = dateFromController.text
      ..dateToController.text = dateToController.text;
  }

  FilterProductsSalesReportsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      reportTypeNotifier,
      periodTypeNotifier,
      productTypeNotifier,
      regionNotifier,
      userNotifier,
      isMarketingNotifier,
      dateFromController,
      dateToController,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return reportTypeNotifier.value != ReportTypeEnum.dateMonth ||
        periodTypeNotifier.value != PeriodTypeEnum.monthly ||
        productTypeNotifier.value != null ||
        regionNotifier.value != null ||
        userNotifier.value != null ||
        isMarketingNotifier.value ||
        dateFromController.text.isNotEmpty ||
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
