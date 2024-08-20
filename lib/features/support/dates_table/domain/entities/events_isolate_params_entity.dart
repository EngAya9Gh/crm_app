import 'dart:collection';

import '../../../../../model/calendar/event_model.dart';

class EventsIsolateParamsEntity {
  List<EventModel> allList;
  List<EventModel> filteredList;
  List<EventModel> selectedDayEvents;
  EventModel? updatedEvent;
  EventModel? oldEvent;
  LinkedHashMap<DateTime, List<EventModel>>? eventDataSource;

  EventsIsolateParamsEntity({
    required this.allList,
    required this.filteredList,
    required this.selectedDayEvents,
    this.updatedEvent,
    this.oldEvent,
    this.eventDataSource,
  });
}
