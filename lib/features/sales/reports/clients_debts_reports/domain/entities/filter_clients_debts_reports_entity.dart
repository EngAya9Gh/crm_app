import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../model/usermodel.dart';

class FilterClientsDebtsReportsEntity {
  FilterClientsDebtsReportsEntity();

  ValueNotifier<ReportTypeEnum> reportTypeNotifier =
      ValueNotifier<ReportTypeEnum>(ReportTypeEnum.allRegion);
  ValueNotifier<RegionModel?> regionNotifier =
      ValueNotifier<RegionModel?>(null);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier<UserModel?>(null);

  ValueNotifier<bool> isMarketingNotifier = ValueNotifier<bool>(true);

  void clearFilters() {
    reportTypeNotifier.value = ReportTypeEnum.allRegion;

    regionNotifier.value = null;
    userNotifier.value = null;
    isMarketingNotifier.value = true;
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
    return _previousState!..savePreviousState();
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
        isMarketingNotifier.value == false;
  }
}
