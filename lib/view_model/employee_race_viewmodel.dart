import 'package:async/async.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/employee_report_model.dart';
import '../ui/screen/target/target_data.dart';

class EmployeeRaceViewmodel extends ChangeNotifier {
  // region Variables
  DateFilterType selectedDateFilterType = DateFilterType.yearly;
  int? selectedYear;
  int? selectedQuarterYear;
  int? selectedQuarter;
  int? selectedMonthYear;
  int? selectedMonth;
  late String fkCountry;

  PageState<List<EmployeeReportModel>> employeeMonthReportState = PageState.init();
  PageState<List<EmployeeReportModel>> employeeQuarterReportState = PageState.init();
  PageState<List<EmployeeReportModel>> employeeYearReportState = PageState.init();
  CancelableOperation<List<EmployeeReportModel>>? _cancelableFuture;

  //endregion

  String get getFromQuarter {
    return DateTime(selectedQuarterYear!, (selectedQuarter! - 1) * 3 + 1).toIso8601String();
  }

  String get getToQuarter {
    return DateTime(selectedQuarterYear!, (selectedQuarter! - 1) * 3 + 3).toIso8601String();
  }

  setFkCountry(String fkCountry) {
    this.fkCountry = fkCountry;
  }

  onChangeSelectedDateFilterType(int index) async {
    selectedDateFilterType = DateFilterType.values[index];
    notifyListeners();

    if (selectedDateFilterType == DateFilterType.yearly &&
        (selectedYear == null || employeeYearReportState.isSuccess)) {
      return;
    }
    if (selectedDateFilterType == DateFilterType.quarterly &&
        (selectedQuarter == null || selectedQuarterYear == null || employeeQuarterReportState.isSuccess)) {
      return;
    }
    if (selectedDateFilterType == DateFilterType.monthly &&
        (selectedMonth == null || selectedMonthYear == null || employeeMonthReportState.isSuccess)) {
      return;
    }

    getEmployeeReport();
  }

  Future<void> getEmployeeReport() async {
    Map<String, dynamic> queryParams = {};
    Map<String, dynamic> body = {};

    if (selectedDateFilterType == DateFilterType.yearly) {
      queryParams = {
        "year": selectedYear.toString(),
      };
    } else if (selectedDateFilterType == DateFilterType.quarterly) {
      queryParams = {
        "from": getFromQuarter,
        "to": getToQuarter,
      };
    } else {
      queryParams = {
        "month": DateTime(selectedMonthYear!, selectedMonth!).toIso8601String(),
      };
    }

    body = body..addAll({"type": selectedDateFilterType.type});
    queryParams = queryParams..addAll({"fk_country": fkCountry});

    await _cancelableFuture?.cancel();

    _fetchData(body: body, queryParams: queryParams);
  }

  fetchYearly({
    required Map<String, dynamic> queryParams,
    required Map<String, dynamic> body,
  }) async {
    try {
      if (!employeeYearReportState.isLoading) {
        employeeYearReportState = employeeYearReportState.changeToLoading;
        notifyListeners();
      }

      _cancelableFuture = CancelableOperation.fromFuture(_getReportApi(body: body, queryParams: queryParams));

      List<EmployeeReportModel> list = await _cancelableFuture?.value ?? [];

      list = list
          .map((e) => e.copyWith(
              percentage: e.salary == null || e.sales == null
                  ? null
                  : ((num.parse(e.sales!) / (num.parse(e.salary!) * 6 * 12)) * 100).toStringAsFixed(2)))
          .toList()
        ..sort((a, b) => num.parse(b.percentage ?? "0").compareTo(num.parse(a.percentage ?? "0")));

      employeeYearReportState = employeeYearReportState.changeToLoaded(list ?? []);

      notifyListeners();
    } catch (e) {
      employeeYearReportState = employeeYearReportState.changeToFailed;
      notifyListeners();
    }
  }

  fetchQuarterly({
    required Map<String, dynamic> queryParams,
    required Map<String, dynamic> body,
  }) async {
    try {
      if (!employeeQuarterReportState.isLoading) {
        employeeQuarterReportState = employeeQuarterReportState.changeToLoading;
        notifyListeners();
      }

      _cancelableFuture = CancelableOperation.fromFuture(_getReportApi(body: body, queryParams: queryParams));

      List<EmployeeReportModel> list = await _cancelableFuture?.value ?? [];

      list = list
          .map((e) => e.copyWith(
              percentage: e.salary == null || e.sales == null
                  ? null
                  : ((num.parse(e.sales!) / (num.parse(e.salary!) * 6 * 3)) * 100).toStringAsFixed(2)))
          .toList()
        ..sort((a, b) => num.parse(b.percentage ?? "0").compareTo(num.parse(a.percentage ?? "0")));

      employeeQuarterReportState = employeeQuarterReportState.changeToLoaded(list ?? []);

      notifyListeners();
    } catch (e) {
      employeeQuarterReportState = employeeQuarterReportState.changeToFailed;
      notifyListeners();
    }
  }

  fetchMonthly({
    required Map<String, dynamic> queryParams,
    required Map<String, dynamic> body,
  }) async {
    try {
      if (!employeeMonthReportState.isLoading) {
        employeeMonthReportState = employeeMonthReportState.changeToLoading;
        notifyListeners();
      }

      _cancelableFuture = CancelableOperation.fromFuture(_getReportApi(body: body, queryParams: queryParams));

      List<EmployeeReportModel> list = await _cancelableFuture?.value ?? [];

      list = list
          .map((e) => e.copyWith(
              percentage: e.salary == null || e.sales == null
                  ? null
                  : ((num.parse(e.sales!) / (num.parse(e.salary!) * 6)) * 100).toStringAsFixed(2)))
          .toList()
        ..sort((a, b) => num.parse(b.percentage ?? "0.0").compareTo(num.parse(a.percentage ?? "0.0")));

      employeeMonthReportState = employeeMonthReportState.changeToLoaded(list);

      notifyListeners();
    } catch (e) {
      employeeMonthReportState = employeeMonthReportState.changeToFailed;
      notifyListeners();
    }
  }

  Future<List<EmployeeReportModel>> _getReportApi({
    required Map<String, dynamic> queryParams,
    required Map<String, dynamic> body,
  }) async {
    final uri = Uri.parse(url);

    final requestUrl = Uri(
      host: uri.host,
      scheme: uri.scheme,
      port: uri.port,
      queryParameters: queryParams,
      path: uri.path + 'reports/reportsales.php',
    );

    var data = await Api().post(
      url: requestUrl.toString(),
      body: body,
      token: null,
    );

    List<EmployeeReportModel> list = convertListFromJson(data, (json) => EmployeeReportModel.fromJson(json));
    return list;
  }

  void _fetchData({
    required Map<String, dynamic> queryParams,
    required Map<String, dynamic> body,
  }) {
    switch (selectedDateFilterType) {
      case DateFilterType.monthly:
        fetchMonthly(queryParams: queryParams, body: body);
        break;
      case DateFilterType.quarterly:
        fetchQuarterly(queryParams: queryParams, body: body);
        break;
      case DateFilterType.yearly:
        fetchYearly(queryParams: queryParams, body: body);
        break;
    }
  }

  onChangeMonth(int numberMonth) {
    selectedMonth = numberMonth;
    getEmployeeReport();
  }

  onChangeMonthYear(int year) {
    selectedMonthYear = year;
    if (selectedMonth == null) {
      return;
    }
    getEmployeeReport();
  }

  onChangeQuarter(int quarter) {
    selectedQuarter = quarter;
    getEmployeeReport();
  }

  onChangeQuarterYear(int year) {
    selectedQuarterYear = year;
    if (selectedQuarter == null) {
      return;
    }
    getEmployeeReport();
  }

  onChangeYear(int year) {
    selectedYear = year;
    getEmployeeReport();
  }

  init() {
    selectedDateFilterType = DateFilterType.yearly;
    selectedYear = null;
    selectedQuarterYear = null;
    selectedQuarter = null;
    selectedMonthYear = null;
    selectedMonth = null;

    employeeMonthReportState = PageState.init();
    employeeQuarterReportState = PageState.init();
    employeeYearReportState = PageState.init();
    _cancelableFuture = null;
    notifyListeners();
  }
}
