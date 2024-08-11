import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../model/calendar/event_model.dart';
import '../../../../../model/maincitymodel.dart';

class DatesTablePageVariablesEntity {
  LinkedHashMap<DateTime, List<EventModel>> eventDataSource = LinkedHashMap();
  List<EventModel> allList = [];
  List<EventModel> filteredList = [];
  ValueNotifier<List<EventModel>> selectedDayEvents = ValueNotifier([]);
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  List<MainCityModel> allMainCities = [];
  Map<int, List<int>> loadedMonths = {};

  DateTime firstDay = DateTime.now();
  DateTime lastDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;

  int get _currentYear => DateTime.now().year;

  int get _currentMonth => DateTime.now().month;

  void clear() {
    eventDataSource.clear();
    allList.clear();
    filteredList.clear();
    selectedDayEvents.value = [];
    searchController.clear();
    totalCount = 0;
    isNewFilter = true;
    hasReachedEnd = false;
    loadedMonths.clear();
    firstDay = DateTime.now();
    lastDay = DateTime.now();
    focusedDay = DateTime.now();
    selectedDay = null;
    calendarFormat = CalendarFormat.month;
  }

  void loadCalendarData() {
    _handleLoadedMonths();
    _loadFirstDay();
    _loadLastDay();
  }

  int _lastDayOfMoth({int? year, int? month}) {
    if (year != null && month != null) {
      return DateTime(year, month + 1, 0).day;
    } else if (month != null) {
      return DateTime(_currentYear, month + 1, 0).day;
    }
    return DateTime(_currentYear, _currentMonth + 1, 0).day;
  }

  bool isMonthLoaded(DateTime date) {
    return loadedMonths.containsKey(date.year) &&
        loadedMonths[date.year]!.contains(date.month);
  }

  void _loadFirstDay() {
    // if month is 7 then the first day is 1st of 6th month
    late DateTime date;
    if (loadedMonths.isEmpty) {
      date = DateTime(_currentYear, _currentMonth);
    } else {
      date = DateTime(loadedMonths.keys.first, loadedMonths.values.first.first);
    }
    firstDay = DateTime(date.year, date.month - 1, 1);
  }

  void _loadLastDay() {
    // if month is 7 then the last day is 31st of 8th month
    late DateTime date;
    if (loadedMonths.isEmpty) {
      date = DateTime(_currentYear, _currentMonth);
    } else {
      date = DateTime(
        loadedMonths.keys.last,
        loadedMonths.values.last.last,
      );
    }

    lastDay = DateTime(date.year, date.month + 1,
        _lastDayOfMoth(year: date.year, month: date.month + 1));
  }

  void _handleLoadedMonths() {
    _updateLoadedMonths(focusedDay);
    _sortEventMap();
  }

  void _updateLoadedMonths(DateTime date) {
    if (!loadedMonths.containsKey(date.year)) {
      loadedMonths[date.year] = [];
    }
    if (!loadedMonths[date.year]!.contains(date.month)) {
      loadedMonths[date.year]!.add(date.month);
    }
  }

  void _sortEventMap() {
    loadedMonths = loadedMonths.map((key, value) {
      value.sort();
      return MapEntry(key, value);
    });
    loadedMonths = Map.fromEntries(loadedMonths.entries.toList()
      ..sort((e1, e2) => e1.key.compareTo(e2.key)));
  }

  void loadEventsForSelectedDay() {
    selectedDayEvents.value = List.from(eventDataSource[selectedDay] ?? []);
  }
}
