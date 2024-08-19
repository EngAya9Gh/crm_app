import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../model/usermodel.dart';

class FilterClientsDebtsReportsEntity {
  FilterClientsDebtsReportsEntity();

  ValueNotifier<ReportTypeEnum> _reportTypeNotifier =
      ValueNotifier<ReportTypeEnum>(ReportTypeEnum.allRegion);
  ValueNotifier<RegionModel?> _regionNotifier =
      ValueNotifier<RegionModel?>(null);
  ValueNotifier<UserModel?> _userNotifier = ValueNotifier<UserModel?>(null);

  ValueNotifier<bool> _isMarketingNotifier = ValueNotifier<bool>(false);

  ValueNotifier<ReportTypeEnum> get reportTypeNotifier => _reportTypeNotifier;

  ValueNotifier<RegionModel?> get regionNotifier => _regionNotifier;

  ValueNotifier<UserModel?> get userNotifier => _userNotifier;

  ValueNotifier<bool> get isMarketingNotifier => _isMarketingNotifier;

  set setReportTypeNotifierValue(ReportTypeEnum? value) {
    if (value != null) _reportTypeNotifier.value = value;
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

  void clearFilters() {
    reportTypeNotifier.value = ReportTypeEnum.allRegion;
    regionNotifier.value = null;
    userNotifier.value = null;
    isMarketingNotifier.value = false;
  }

  FilterClientsDebtsReportsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsDebtsReportsEntity()
      ..reportTypeNotifier.value = reportTypeNotifier.value
      ..regionNotifier.value = regionNotifier.value
      ..userNotifier.value = userNotifier.value
      ..isMarketingNotifier.value = isMarketingNotifier.value;
  }

  FilterClientsDebtsReportsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }

    _changeValuesToNotifyListeners();

    return _previousState!..savePreviousState();
  }

  void _changeValuesToNotifyListeners() {
    this.reportTypeNotifier.value = _previousState!.reportTypeNotifier.value;
    this.regionNotifier.value = _previousState!.regionNotifier.value;
    this.userNotifier.value = _previousState!.userNotifier.value;
    this.isMarketingNotifier.value = _previousState!.isMarketingNotifier.value;
  }

  Iterable<Listenable?> listenables() {
    return [
      reportTypeNotifier,
      regionNotifier,
      userNotifier,
      isMarketingNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return reportTypeNotifier.value != ReportTypeEnum.allRegion ||
        regionNotifier.value != null ||
        userNotifier.value != null ||
        isMarketingNotifier.value;
  }
}
