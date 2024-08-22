import 'dart:collection';

import '../../../../../core/common/models/event_model.dart';

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
