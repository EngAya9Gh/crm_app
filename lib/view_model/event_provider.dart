import 'dart:collection';

import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/clientmodel.dart';

class EventProvider extends ChangeNotifier {
  bool is_save = false;
  List<EventModel> _events = [];

  List<EventModel> get events => _events;
  LinkedHashMap<DateTime, List<EventModel>> eventDataSource = LinkedHashMap();
  late String fkCountry;
  bool isloadingDoneEvent = false;

  List<ClientModel1> listclient = [];

  void setvalue_save() {
    is_save = !is_save;
    notifyListeners();
  }

  void setvalueClient(List<ClientModel1> list) {
    listclient = list;
    notifyListeners();
  }

  void addEvents(EventModel event) {
    _events.add(event);
    notifyListeners();
  }

  void handleEventsMap({
    List<EventModel>? eventsList,
    EventModel? updatedEvent,
    EventModel? oldEvent,
  }) {
    if (eventsList != null) _events = List.from(eventsList);
    if (updatedEvent != null) {
      _handleUpdatedEvent(updatedEvent: updatedEvent, oldEvent: oldEvent);
    }

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      _events,
      key: (item) => (item as EventModel).from,
      value: (item) => _events.where((element) {
        return isSameDay((item as EventModel).from, element.from);
      }).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  void _handleUpdatedEvent(
      {required EventModel updatedEvent, EventModel? oldEvent}) {
    if (oldEvent != null) {
      _events.removeWhere((element) => element.from == oldEvent.from);
      _events.add(updatedEvent);
      return;
    }

    final index = _events.indexWhere((element) {
      return element.from == updatedEvent.from;
    });
    if (index != -1) {
      _events[index] = updatedEvent;
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Future<void> getevent_Client(String? searchfilter) async {
    late EventModel event; //
    _events.clear();

    listclient.forEach((element) {
      if (element.idClients == searchfilter) {
        if (element.date_visit_Client != null) {
          DateTime temp =
              DateTime.parse(element.date_visit_Client.toString()).hour >= 21
                  ? DateTime.parse(element.date_visit_Client.toString())
                      .subtract(Duration(hours: 3))
                  : DateTime.parse(element.date_visit_Client.toString());

          event = EventModel(
              fkIdClient: element.idClients,
              title: element.nameEnterprise.toString(),
              description: 'description',
              from: temp,
              to: temp.add(Duration(hours: 2)),
              idinvoice: null,
              typedate: '');
          addEvents(event);
        }
      }
    });

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      _events,
      key: (item) => (item as EventModel).from,
      value: (item) => _events
          .where(
              (element) => isSameDay((item as EventModel).from, element.from))
          .toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  Future<void> getevent_AllClient() async {
    late EventModel event; //
    _events.clear();

    listclient.forEach((element) {
      if (element.date_visit_Client != null) {
        DateTime temp =
            DateTime.parse(element.date_visit_Client.toString()).hour >= 21
                ? DateTime.parse(element.date_visit_Client.toString())
                    .subtract(Duration(hours: 3))
                : DateTime.parse(element.date_visit_Client.toString());

        event = EventModel(
            fkIdClient: element.idClients,
            title: element.nameEnterprise.toString(),
            description: 'description',
            from: temp,
            to: temp.add(Duration(hours: 2)),
            idinvoice: null,
            typedate: '');
        addEvents(event);
      }
    });

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      _events,
      key: (item) => (item as EventModel).from,
      value: (item) => _events
          .where(
              (element) => isSameDay((item as EventModel).from, element.from))
          .toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  addEvent(EventModel event) {
    _events.add(event);

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      events,
      key: (item) => (item as EventModel).from,
      value: (item) => events
          .where(
              (element) => isSameDay((item as EventModel).from, element.from))
          .toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  checkAndActionEvent(EventModel event) {
    if (events.any((element) => element.fkIdClient == event.fkIdClient)) {
      _events = _events
          .map((e) => e.fkIdClient == event.fkIdClient ? event : e)
          .toList();
    } else {
      _events.add(event);
    }

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      events,
      key: (item) => (item as EventModel).from,
      value: (item) => events
          .where(
              (element) => isSameDay((item as EventModel).from, element.from))
          .toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }
}
