import 'dart:collection';
import 'dart:isolate';

import 'package:table_calendar/table_calendar.dart';

import '../../../../../model/calendar/event_model.dart';

class IsolateExecutor {
  static List<EventModel> filterEventsList(List<EventModel>? eventsList) {
    return eventsList != null ? List.from(eventsList) : [];
  }

  static List<EventModel> handleUpdatedEvent({
    required List<EventModel> eventsList,
    required EventModel updatedEvent,
    EventModel? oldEvent,
    bool isDayChanged = false,
  }) {
    if (!isSameDay(oldEvent?.from, updatedEvent.from) && isDayChanged) {
      return eventsList..remove(oldEvent);
    }

    return eventsList.map((element) {
      if (element == oldEvent) return updatedEvent;
      return element;
    }).toList();
  }

  static Map<DateTime, List<EventModel>> createMapEvents(
      List<EventModel> filteredList) {
    return Map<DateTime, List<EventModel>>.fromIterable(
      filteredList,
      key: (item) => (item as EventModel).from,
      value: (item) => filteredList.where((element) {
        return isSameDay((item as EventModel).from, element.from);
      }).toList(),
    );
  }

  static LinkedHashMap<DateTime, List<EventModel>> createEventDataSource(
      Map<DateTime, List<EventModel>> mapEvents) {
    return LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    )..addAll(mapEvents);
  }

  static int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}

class IsolateHelper {
  static void handleEventsMapIsolate(Map<String, dynamic> params) {
    final sendPort = params['sendPort'] as SendPort;
    List<EventModel> allList = params['allList'];
    List<EventModel> filteredList = params['filteredList'];
    List<EventModel> selectedDayEvents = params['selectedDayEvents'];
    final updatedEvent = params['updatedEvent'] as EventModel?;
    final oldEvent = params['oldEvent'] as EventModel?;

    filteredList = IsolateExecutor.filterEventsList(filteredList);

    if (updatedEvent != null) {
      filteredList = IsolateExecutor.handleUpdatedEvent(
        eventsList: filteredList,
        updatedEvent: updatedEvent,
        oldEvent: oldEvent,
      );
      allList = IsolateExecutor.handleUpdatedEvent(
        eventsList: allList,
        updatedEvent: updatedEvent,
        oldEvent: oldEvent,
      );
      selectedDayEvents = IsolateExecutor.handleUpdatedEvent(
        eventsList: selectedDayEvents,
        updatedEvent: updatedEvent,
        oldEvent: oldEvent,
        isDayChanged: true,
      );
    }

    final mapEvents = IsolateExecutor.createMapEvents(filteredList);
    final eventDataSource = IsolateExecutor.createEventDataSource(mapEvents);

    sendPort.send({
      'allList': allList,
      'filteredList': filteredList,
      'selectedDayEvents': selectedDayEvents,
      'eventDataSource': eventDataSource,
    });
  }
}
