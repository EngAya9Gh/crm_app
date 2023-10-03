import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import '../api/api.dart';
import '../constants.dart';
import '../helper/get_month_name.dart';
import '../model/branch_race_model.dart';
import '../ui/screen/target/target_data.dart';

enum DateFilterType { monthly, quarterly, yearly, daily }

extension DateFilterExt on DateFilterType {
  String get type {
    switch (this) {
      case DateFilterType.monthly:
        return "datemonth";
      case DateFilterType.quarterly:
        // return "datedays";
      case DateFilterType.daily:
        return "datedays";
      case DateFilterType.yearly:
        return "dateyear";
    }
  }
}

class BranchRaceViewmodel extends ChangeNotifier {
  PageState<List<BranchRaceModel>> targetsState = PageState();
  List<BranchRaceModel> _allTargetsList = [];
  DateFilterType selectedDateFilter = DateFilterType.yearly;
  DateFilterType selectedDateFilterAddTarget = DateFilterType.yearly;
  List<String> monthsFilter = monthList;
  List<String> quartersFilter = QuarterList;
  List<String> quarterYearsFilter = getYears();
  List<String> yearsFilter = getYears();
  String? fkCountry;

  String? selectedMonthFilter;
  String? selectedMonthYearFilter;
  String? selectedQuarterFilter;
  String? selectedQuarterYearFilter;
  String? selectedYearFilter;

  String? selectedMonthAddTarget;
  String? selectedQuarterAddTarget;
  String? selectedYearAddTarget;
  String? selectedRegionId;
  String? branchTarget;
  bool isLoadingAction = false;
  String _querySearch = '';

  String? updateBranchTarget;

  PageState<List<BranchRaceModel>> yearlyState = PageState();
  PageState<List<BranchRaceModel>> quarterState = PageState();
  PageState<List<BranchRaceModel>> monthlyState = PageState();

  init(String fkCountry) {
    targetsState = PageState();
    _allTargetsList = [];
    selectedDateFilter = DateFilterType.yearly;
    _querySearch = '';
    yearlyState = PageState();
    quarterState = PageState();
    monthlyState = PageState();
    selectedQuarterFilter = _getCurrentQuarter;
    selectedQuarterYearFilter = DateTime.now().year.toString();
    selectedMonthFilter = getMonthName(DateTime.now().month);
    selectedMonthYearFilter = DateTime.now().year.toString();
    this.fkCountry = fkCountry;
    notifyListeners();
  }

  resetActionTargetValues() {
    selectedDateFilterAddTarget = DateFilterType.yearly;
    selectedMonthAddTarget = null;
    selectedQuarterAddTarget = null;
    selectedYearAddTarget = null;
    selectedRegionId = null;
    branchTarget = null;
    isLoadingAction = false;
    notifyListeners();
  }

  Future<void> getTargets() async {
    try {
      if (!targetsState.isLoading) {
        targetsState = targetsState.changeToLoading;
        notifyListeners();
      }
      final list = await TargetData.getTarget();
      fillLists(list);
      targetsState = targetsState.changeToLoaded(list);
      onFilterDateTyp();
      notifyListeners();
    } catch (e) {
      targetsState = targetsState.changeToFailed;
      notifyListeners();
    }
  }

  onChangeSelectedFilterTypeAddTarget(int index) {
    selectedDateFilterAddTarget = DateFilterType.values[index];
    notifyListeners();
  }

  onChangeSelectedFilterType(int index, {bool isFromBranchManage = true}) {
    selectedDateFilter = DateFilterType.values[index];
    if (!isFromBranchManage) {
      notifyListeners();
      if (selectedDateFilter == DateFilterType.quarterly &&
          (selectedQuarterFilter != null && selectedQuarterYearFilter != null && !quarterState.isSuccess)) {
        onChangeQuarter(null);
      }

      if (selectedDateFilter == DateFilterType.monthly &&
          (selectedMonthFilter != null && selectedMonthYearFilter != null && !monthlyState.isSuccess)) {
        onChangeMonth(null);
      }

      return;
    }
    selectedMonthFilter = null;
    selectedQuarterFilter = null;
    selectedQuarterYearFilter = null;
    selectedYearFilter = null;
    onFilterDateTyp();
  }

  void onFilterDateTyp() {
    final list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) =>
            element.typeTarget == selectedDateFilter.index.toString() &&
            (element.name_regoin?.toLowerCase().contains(_querySearch) ?? false))
        .toList();

    targetsState = targetsState.copyWith(data: list);
    notifyListeners();
  }

  void fillLists(List<BranchRaceModel> list) {
    _allTargetsList = list;
    monthsFilter = list
        .where((element) => element.typeTarget == DateFilterType.monthly.index.toString())
        .map((e) => getMonthName(int.parse(e.nameTarget ?? '0')))
        .toSet()
        .toList();

    yearsFilter = list
        .where((element) => element.typeTarget == DateFilterType.yearly.index.toString())
        .map((e) => e.yearTarget!)
        .toSet()
        .toList();

    quarterYearsFilter = list
        .where((element) => element.typeTarget == DateFilterType.quarterly.index.toString())
        .map((e) => e.yearTarget!)
        .toSet()
        .toList();
  }

  onChangeMonthYear(String monthYear) {
    selectedMonthYearFilter = monthYear;
    onChangeMonth(null);
    // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // quartersFilter = list
    //     .where((element) =>
    //         element.typeTarget == DateFilterType.quarterly.index.toString() &&
    //         element.yearTarget == selectedQuarterYearFilter)
    //     .map((e) => e.nameTarget!)
    //     .toSet()
    //     .toList();
    // var data  = await Api().post(
    //     url: url +
    //         "target/get_sales_target.php?fk_country=$fkcountry&year=${year}",
    //     body: {'type': 'dateyear'});
    // List<BranchRaceModel> list=[];
    // for (int i = 0; i < data.length; i++)
    //   list.add(BranchRaceModel.fromJson(data[i]));

    // selectedQuarterFilter = null;
    notifyListeners();
  }

  onChangeMonth(String? month) async {
    try {
      if (month != null) {
        selectedMonthFilter = month;
      }

      if (selectedMonthYearFilter == null) {
        return;
      }

      DateTime date = DateTime(int.parse(selectedMonthYearFilter!), getMonthNumber(selectedMonthFilter!), 01);

      monthlyState = monthlyState.changeToLoading;
      notifyListeners();

      // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
      //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
      //     .toList();
      //
      // list = list.where((element) => element.nameTarget == getMonthIndex(selectedMonthFilter!).toString()).toList();

      // list = list.where((element) => element.nameTarget == getMonthNumber(selectedMonthFilter!).toString()).toList();
      var data = await Api().post(
          url: url + "target/get_sales_target.php?fk_country=$fkCountry&month=${date.toIso8601String()}",
          body: {'type': 'datemonth'});
      List<BranchRaceModel> list = [];
      for (int i = 0; i < data.length; i++) list.add(BranchRaceModel.fromJson(data[i]));

      monthlyState = monthlyState.changeToLoaded(list);
      notifyListeners();
    } catch (e) {
      monthlyState = monthlyState.changeToFailed;
      notifyListeners();
    }
  }

  onChangeYear(String year) async {
    selectedYearFilter = year;

    // List<BranchRaceModel> list = List<>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // list = list.where((element) => element.yearTarget == selectedYearFilter).toList();

    try {
      yearlyState = yearlyState.changeToLoading;
      notifyListeners();

      var data = await Api()
          .post(url: url + "target/get_sales_target.php?fk_country=$fkCountry&year=$year", body: {'type': 'dateyear'});
      List<BranchRaceModel> list = [];
      for (int i = 0; i < data.length; i++) list.add(BranchRaceModel.fromJson(data[i]));

      yearlyState = yearlyState.changeToLoaded(list);

      notifyListeners();
    } catch (e) {
      yearlyState = yearlyState.changeToFailed;
      notifyListeners();
    }
  }

  onChangeQuarter(String? quarter) async {
    if (quarter != null) {
      selectedQuarterFilter = quarter;
    }

    if (selectedQuarterYearFilter == null) {
      return;
    }

    try {
      quarterState = quarterState.changeToLoading;
      notifyListeners();

      //
      // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
      //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
      //     .toList();
      //
      // list = list
      //     .where(
      //         (element) => element.yearTarget == selectedQuarterYearFilter && element.nameTarget == selectedQuarterFilter)
      //     .toList();

      final params =
          "target/get_sales_target.php?fk_country=$fkCountry&from=$getFromQuarter&to=$getToQuarter&Q=$selectedQuarterFilter";

      print("params $params");

      var data = await Api().post(url: url + params, body: {'type': 'datedays'});
      List<BranchRaceModel> list = [];
      for (int i = 0; i < data.length; i++) list.add(BranchRaceModel.fromJson(data[i]));

      quarterState = quarterState.changeToLoaded(list);

      notifyListeners();
    } catch (e) {
      quarterState = quarterState.changeToLoading;
      notifyListeners();
    }
  }

  onChangeQuarterYear(String quarterYear) async {
    selectedQuarterYearFilter = quarterYear;
    onChangeQuarter(null);
    // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // quartersFilter = list
    //     .where((element) =>
    //         element.typeTarget == DateFilterType.quarterly.index.toString() &&
    //         element.yearTarget == selectedQuarterYearFilter)
    //     .map((e) => e.nameTarget!)
    //     .toSet()
    //     .toList();
    // var data  = await Api().post(
    //     url: url +
    //         "target/get_sales_target.php?fk_country=$fkcountry&year=${year}",
    //     body: {'type': 'dateyear'});
    // List<BranchRaceModel> list=[];
    // for (int i = 0; i < data.length; i++)
    //   list.add(BranchRaceModel.fromJson(data[i]));

    // selectedQuarterFilter = null;
    notifyListeners();
  }

  onChangeSelectedMonthAddTarget(String monthNumber) {
    selectedMonthAddTarget = monthNumber;
    notifyListeners();
  }

  onChangeSelectedYearAddTarget(String year) {
    selectedYearAddTarget = year;
    notifyListeners();
  }

  onChangeSelectedQuarterAddTarget(String quarter) {
    selectedQuarterAddTarget = quarter;
    notifyListeners();
  }

  onChangeBranch(String regionId) {
    selectedRegionId = regionId;
    notifyListeners();
  }

  onSaveBranchTarget(String branchTarget) {
    this.branchTarget = branchTarget;
    notifyListeners();
  }

  String get getFromQuarter {
    return DateTime(int.parse(selectedQuarterYearFilter!), (getQuarterNumber(selectedQuarterFilter!) - 1) * 3 + 1)
        .toIso8601String();
  }

  String get getToQuarter {
    return DateTime(int.parse(selectedQuarterYearFilter!), (getQuarterNumber(selectedQuarterFilter!) - 1) * 3 + 3)
        .toIso8601String();
  }

  String get _getCurrentQuarter {
    final int month = DateTime.now().month;
    if (month >= 1 && month <= 3) {
      return "Q1";
    } else if (month > 3 && month <= 6) {
      return "Q2";
    } else if (month > 6 && month <= 9) {
      return "Q3";
    } else {
      return "Q4";
    }
  }

  onAddTarget({required VoidCallback onSuccess, BranchRaceModel? branchRaceModel}) async {
    try {
      isLoadingAction = true;
      notifyListeners();

      dynamic response;
      if (branchRaceModel?.idTarget == null) {
        final body = {
          "type_target": selectedDateFilterAddTarget.index.toString(),
          "name_target": selectedDateFilterAddTarget == DateFilterType.monthly
              ? selectedMonthAddTarget
              : selectedDateFilterAddTarget == DateFilterType.quarterly
                  ? selectedQuarterAddTarget
                  : "",
          "year_target": selectedYearAddTarget,
          "value_target": branchTarget,
          "fk_region": selectedRegionId,
        };

        response = await Api().post(
          url: url + 'target/add_target.php',
          body: body,
          token: null,
        );
      } else {
        final body = {
          "type_target": branchRaceModel?.typeTarget,
          "name_target": branchRaceModel?.nameTarget ?? '',
          "year_target": branchRaceModel?.yearTarget,
          "value_target": updateBranchTarget,
          "fk_region": branchRaceModel?.fkRegion,
        };

        response = await Api().post(
          url: url + 'target/update_target.php?id_target=${branchRaceModel?.idTarget}',
          body: body,
          token: null,
        );
      }

      selectedDateFilter = selectedDateFilterAddTarget;
      resetActionTargetValues();
      getTargets();
      onSuccess();
    } catch (e, stackTrace) {
      print("stackTrace $stackTrace");
      isLoadingAction = false;
      notifyListeners();
    }
  }

  onEditBranchTarget(String updateBranchTarget) {
    this.updateBranchTarget = updateBranchTarget;
    notifyListeners();
  }

  onSearch(String query) {
    if (!targetsState.isSuccess) {
      return;
    }
    _querySearch = query;

    final list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) =>
            element.typeTarget == selectedDateFilter.index.toString() &&
            (element.name_regoin?.toLowerCase().contains(_querySearch) ?? false))
        .toList();
    targetsState = targetsState.copyWith(data: list);
    notifyListeners();
  }
}
