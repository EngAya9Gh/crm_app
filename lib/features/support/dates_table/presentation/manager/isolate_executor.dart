import 'dart:collection';
import 'dart:isolate';

import 'package:table_calendar/table_calendar.dart';

import '../../../../../model/calendar/event_model.dart';

class IsolateExecutor {
  static List<EventModel> filterEventsList(List<EventModel>? eventsList) {
    return eventsList != null ? List.from(eventsList) : [];
  }

  static List<EventModel> handleUpdatedEvent({
    required List<EventModel> filteredList,
    required EventModel updatedEvent,
    EventModel? oldEvent,
  }) {
    return filteredList.map((event) {
      if (oldEvent != null && event == oldEvent) {
        return updatedEvent;
      }
      return event;
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
    final eventsList = params['eventsList'] as List<EventModel>?;
    final updatedEvent = params['updatedEvent'] as EventModel?;
    final oldEvent = params['oldEvent'] as EventModel?;

    List<EventModel> filteredList =
        IsolateExecutor.filterEventsList(eventsList);

    if (updatedEvent != null) {
      filteredList = IsolateExecutor.handleUpdatedEvent(
        filteredList: filteredList,
        updatedEvent: updatedEvent,
        oldEvent: oldEvent,
      );
    }

    final mapEvents = IsolateExecutor.createMapEvents(filteredList);
    final eventDataSource = IsolateExecutor.createEventDataSource(mapEvents);

    sendPort.send(eventDataSource);
  }
}
