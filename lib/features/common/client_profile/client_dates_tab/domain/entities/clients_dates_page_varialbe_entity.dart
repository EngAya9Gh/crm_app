import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../data/models/client_date_model.dart';

class ClientsDatesPageVariablesEntity {
  List<ClientDateModel> allList = const [];
  int totalCount = 0;
  bool hasReachedEnd = false;
  TextEditingController searchController;
  LinkedHashMap<DateTime, List<ClientDateModel>> eventDataSource = LinkedHashMap();
  ValueNotifier<List<ClientDateModel>> selectedDayEvents = ValueNotifier([]);
  DateTime? selectedDay;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime firstDay = DateTime.now();
  DateTime lastDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  int get _currentYear => DateTime.now().year;

  int get _currentMonth => DateTime.now().month;
  Map<int, List<int>> loadedMonths = {};


  ClientsDatesPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.hasReachedEnd = false,
    TextEditingController? searchController,
  }) : searchController = searchController ?? TextEditingController();

  void clear() {
    eventDataSource.clear();
    allList= const [];
    selectedDayEvents.value = [];
    searchController.clear();
    totalCount = 0;
    firstDay = DateTime.now();
    lastDay = DateTime.now();
    focusedDay = DateTime.now();
    selectedDay = null;
    hasReachedEnd = false;
    calendarFormat = CalendarFormat.month;
  }
  void loadCalendarData() {
    _handleLoadedMonths();
    _loadFirstDay();
    _loadLastDay();
  }
  void _sortEventMap() {
    loadedMonths = LinkedHashMap.fromEntries(
      loadedMonths.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
  }
  void _handleLoadedMonths() {
    if (!loadedMonths.containsKey(focusedDay.year)) {
      loadedMonths[focusedDay.year] = [focusedDay.month];
      _sortEventMap();
      return;
    }
    if (focusedDay.month < loadedMonths[focusedDay.year]!.first) {
      return loadedMonths[focusedDay.year]!.insert(0, focusedDay.month);
    }
    if (focusedDay.month > loadedMonths[focusedDay.year]!.last) {
      loadedMonths[focusedDay.year]!.add(focusedDay.month);
    }
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
  int _lastDayOfMoth({int? year, int? month}) {
    if (year != null && month != null) {
      return DateTime(year, month + 1, 0).day;
    } else if (month != null) {
      return DateTime(_currentYear, month + 1, 0).day;
    }
    return DateTime(_currentYear, _currentMonth + 1, 0).day;
  }

  void loadEventsForSelectedDay() {
    selectedDayEvents.value = List.from(eventDataSource[selectedDay] ?? []);
  }
}
