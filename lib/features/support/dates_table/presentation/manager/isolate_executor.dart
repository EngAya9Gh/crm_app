import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../domain/entities/events_isolate_params_entity.dart';

class IsolateExecutor {
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
  static EventsIsolateParamsEntity handleEventsMapIsolate(
    EventsIsolateParamsEntity params,
  ) {
    if (params.updatedEvent != null) {
      params.filteredList = IsolateExecutor.handleUpdatedEvent(
        eventsList: params.filteredList,
        updatedEvent: params.updatedEvent!,
        oldEvent: params.oldEvent,
      );
      params.allList = IsolateExecutor.handleUpdatedEvent(
        eventsList: params.allList,
        updatedEvent: params.updatedEvent!,
        oldEvent: params.oldEvent,
      );
      params.selectedDayEvents = IsolateExecutor.handleUpdatedEvent(
        eventsList: params.selectedDayEvents,
        updatedEvent: params.updatedEvent!,
        oldEvent: params.oldEvent,
        isDayChanged: true,
      );
    }

    final mapEvents = IsolateExecutor.createMapEvents(params.filteredList);
    final eventDataSource = IsolateExecutor.createEventDataSource(mapEvents);

    return EventsIsolateParamsEntity(
      allList: params.allList,
      filteredList: params.filteredList,
      selectedDayEvents: params.selectedDayEvents,
      updatedEvent: params.updatedEvent,
      oldEvent: params.oldEvent,
      eventDataSource: eventDataSource,
    );
  }
}
