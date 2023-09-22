import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import '../api/api.dart';
import '../constants.dart';
import '../helper/get_month_name.dart';
import '../model/branch_race_model.dart';
import '../ui/screen/target/target_data.dart';

enum DateFilterType { monthly, quarterly, yearly }

extension DateFilterExt on DateFilterType {
  String get type {
    switch (this) {
      case DateFilterType.monthly:
        return "datemonth";
      case DateFilterType.quarterly:
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
  List<String> monthsFilter = [];
  List<String> quartersFilter = [];
  List<String> quarterYearsFilter = [];
  List<String> yearsFilter = [];

  String? selectedMonthFilter;
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

  init() {
    targetsState = PageState();
    _allTargetsList = [];
    selectedDateFilter = DateFilterType.yearly;
    _querySearch = '';
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

  onChangeSelectedFilterType(int index) {
    selectedDateFilter = DateFilterType.values[index];
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

  onChangeMonth(DateTime monthdate, String month, String fkcountry) async {
    selectedMonthFilter = month;

    // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // list = list.where((element) => element.nameTarget == getMonthIndex(selectedMonthFilter!).toString()).toList();

    // list = list.where((element) => element.nameTarget == getMonthNumber(selectedMonthFilter!).toString()).toList();
    var data = await Api().post(
        url: url + "target/get_sales_target.php?fk_country=$fkcountry&month=${monthdate.toString()}",
        body: {'type': 'datemonth'});
    List<BranchRaceModel> list = [];
    for (int i = 0; i < data.length; i++)
      list.add(BranchRaceModel.fromJson(data[i]));

    targetsState = targetsState.copyWith(data: list);
    for (int i = 0; i < targetsState.data!.length; i++)
      print(targetsState.data![i].y);
      notifyListeners();
  }

  onChangeYear(String year, String fkcountry) async {
    selectedYearFilter = year;

    // List<BranchRaceModel> list = List<>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // list = list.where((element) => element.yearTarget == selectedYearFilter).toList();
    var data = await Api()
        .post(url: url + "target/get_sales_target.php?fk_country=$fkcountry&year=${year}", body: {'type': 'dateyear'});
    List<BranchRaceModel> list = [];
    for (int i = 0; i < data.length; i++) list.add(BranchRaceModel.fromJson(data[i]));

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  onChangeQuarter(String quarter, String fkcountry, DateTime Datefrom, DateTime Dateto) async {
    selectedQuarterFilter = quarter;

    if (selectedQuarterYearFilter == null) {
      return;
    }
    //
    // List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
    //     .where((element) => element.typeTarget == selectedDateFilter.index.toString())
    //     .toList();
    //
    // list = list
    //     .where(
    //         (element) => element.yearTarget == selectedQuarterYearFilter && element.nameTarget == selectedQuarterFilter)
    //     .toList();

    var data = await Api().post(
        url: url +
            "target/get_sales_target.php?fk_country=$fkcountry&from=${Datefrom.toString()}&to=${Dateto.toString()}&Q=$quarter",
        body: {'type': 'datedays'});
    List<BranchRaceModel> list = [];
    for (int i = 0; i < data.length; i++) list.add(BranchRaceModel.fromJson(data[i]));

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  onChangeQuarterYear(String quarterYear) async {
    selectedQuarterYearFilter = quarterYear;
    List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    quartersFilter = list
        .where((element) =>
            element.typeTarget == DateFilterType.quarterly.index.toString() &&
            element.yearTarget == selectedQuarterYearFilter)
        .map((e) => e.nameTarget!)
        .toSet()
        .toList();
    // var data  = await Api().post(
    //     url: url +
    //         "target/get_sales_target.php?fk_country=$fkcountry&year=${year}",
    //     body: {'type': 'dateyear'});
    // List<BranchRaceModel> list=[];
    // for (int i = 0; i < data.length; i++)
    //   list.add(BranchRaceModel.fromJson(data[i]));

    selectedQuarterFilter = null;
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

  onAddTarget({required VoidCallback onSuccess, BranchRaceModel? branchRaceModel}) async {
    print("selectedMonthAddTarget: $selectedMonthAddTarget");
    print("selectedYearAddTarget: $selectedYearAddTarget");
    print("selectedQuarterAddTarget: $selectedQuarterAddTarget");
    print("selectedRegionId: $selectedRegionId");
    print("branchTarget: $branchTarget");

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
