import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import '../helper/get_month_name.dart';
import '../model/branch_race_model.dart';
import '../ui/screen/target/target_data.dart';

enum DateFilterType { monthly, quarterly, yearly }

class BranchRaceViewmodel extends ChangeNotifier {
  PageState<List<BranchRaceModel>> targetsState = PageState();
  List<BranchRaceModel> _allTargetsList = [];
  DateFilterType selectedDateFilter = DateFilterType.yearly;

  List<String> months = [];
  List<String> quarters = [];
  List<String> quarterYears = [];
  List<String> years = [];

  String? selectedMonth;
  String? selectedQuarter;
  String? selectedQuarterYear;
  String? selectedYear;

  init() {
    targetsState = PageState();
    _allTargetsList = [];
    selectedDateFilter = DateFilterType.yearly;
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

  onChangeSelectedFilterType(int index) {
    selectedDateFilter = DateFilterType.values[index];
    selectedMonth = null;
    selectedQuarter = null;
    selectedQuarterYear = null;
    selectedYear = null;
    onFilterDateTyp();
  }

  void onFilterDateTyp() {
    final list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  void fillLists(List<BranchRaceModel> list) {
    _allTargetsList = list;
    months = list
        .where((element) => element.typeTarget == DateFilterType.monthly.index.toString())
        .map((e) => getMonthName(int.parse(e.nameTarget ?? '0')))
        .toSet()
        .toList();

    years = list
        .where((element) => element.typeTarget == DateFilterType.yearly.index.toString())
        .map((e) => e.yearTarget!)
        .toSet()
        .toList();

    quarterYears = list
        .where((element) => element.typeTarget == DateFilterType.quarterly.index.toString())
        .map((e) => e.yearTarget!)
        .toSet()
        .toList();
  }

  onChangeMonth(String month) {
    selectedMonth = month;

    List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    list = list.where((element) => element.nameTarget == getMonthIndex(selectedMonth!).toString()).toList();

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  onChangeYear(String year) {
    selectedYear = year;

    List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    list = list.where((element) => element.yearTarget == selectedYear).toList();

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  onChangeQuarter(String quarter) {
    selectedQuarter = quarter;

    if (selectedQuarterYear == null) {
      return;
    }

    List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    list = list
        .where((element) => element.yearTarget == selectedQuarterYear && element.nameTarget == selectedQuarter)
        .toList();

    targetsState = targetsState.copyWith(data: list);

    notifyListeners();
  }

  onChangeQuarterYear(String quarterYear) {
    selectedQuarterYear = quarterYear;
    List<BranchRaceModel> list = List<BranchRaceModel>.from(_allTargetsList)
        .where((element) => element.typeTarget == selectedDateFilter.index.toString())
        .toList();

    quarters = list
        .where((element) =>
            element.typeTarget == DateFilterType.quarterly.index.toString() &&
            element.yearTarget == selectedQuarterYear)
        .map((e) => e.nameTarget!)
        .toSet()
        .toList();

    targetsState = targetsState.copyWith(data: list);

    selectedQuarter = null;
    notifyListeners();
  }
}
