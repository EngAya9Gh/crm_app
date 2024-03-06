import 'dart:collection';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/services/date_installation_service.dart';
// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import '../model/clientmodel.dart';
import '../services/Invoice_Service.dart';
import 'page_state.dart';

class EventProvider extends ChangeNotifier {
  bool is_save = false;
  List<EventModel> _events = [];

  List<EventModel> get events => _events;
  LinkedHashMap<DateTime, List<EventModel>> eventDataSource = LinkedHashMap();
  DateTime _selectDate = DateTime.now();

  List<String>? selectedMainCityFks;
  String? selectedFkUser;
  late String fkCountry;

//when click this date show events المرتبيط for this date just
  List<EventModel> get eventsOfSelectedDate => _events;
  PageState<List<AppointmentModel>> appointmentsState = PageState();
  bool isloadingRescheduleOrCancel = false;

  // List<InvoiceModel> listinvoices = [];
  List<ClientModel1> listclient = [];

  void setvalue_save() {
    is_save = !is_save;
    notifyListeners();
  }

  // void setvalue(List<InvoiceModel> list) {
  //   listinvoices = list;
  //   notifyListeners();
  // }

  resetFilter() {
    selectedMainCityFks = null;
    selectedFkUser = null;
  }

  void setvalueClient(List<ClientModel1> list) {
    listclient = list;
    notifyListeners();
  }

  void addEvents(EventModel event) {
    _events.add(event);
    notifyListeners();
  }

  Future<void> getAppointments() async {
    try {
      if (!appointmentsState.isLoading) {
        appointmentsState = appointmentsState.changeToLoading;
        notifyListeners();
      }

      List<AppointmentModel> list;

      if (selectedFkUser != null && selectedMainCityFks != null) {
        /// mix
        list = await DateInstallationService.getDateInstallationMix(
          fkCountry: fkCountry,
          fkUser: selectedFkUser!,
          mainCityFks: selectedMainCityFks!.map((e) => int.parse(e)).toList(),
        );
      } else if (selectedFkUser != null && selectedMainCityFks == null) {
        /// user
        list = await DateInstallationService.getDateInstallationFkUser(
          fkCountry: fkCountry,
          fkUser: selectedFkUser!,
        );
      } else if (selectedFkUser == null && selectedMainCityFks != null) {
        /// main city
        list = await DateInstallationService.getDateInstallationMainCity(
          fkCountry: fkCountry,
          mainCityFks: selectedMainCityFks!.map((e) => int.parse(e)).toList(),
        );
      } else {
        /// all
        list = await DateInstallationService.getDateInstallationAll(
            fkCountry: fkCountry);
      }

      appointmentsState = appointmentsState.changeToLoaded(list);

      _events = list.map((e) => e.asEvent()).toList();

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

      return;
    } catch (e) {
      appointmentsState = appointmentsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> editSchedule_vm({
    required String scheduleId,
    required DateTime dateClientVisit,
    required DateTime date_end,
    required String processReason,
    required String typeDate,
    required EventModel event,
    required ValueChanged<String> onSuccess,
    required ValueChanged<void> onFailure,
  }) async {
    isloadingRescheduleOrCancel = true;
    notifyListeners();

    final data = await Invoice_Service().editScheduleInstallation(
        scheduleId: scheduleId,
        dateClientVisit: dateClientVisit.toString(),
        date_end: date_end.toString(),
        typeSchedule: typeDate,
        processReason: processReason);
    final list = eventDataSource[event.from] ?? [];
    final index = list.indexOf(event);
    if (index == -1) {
      onFailure;
      return;
    }
    list[index] = list[index].copyWith(from: dateClientVisit, to: date_end);
    eventDataSource[event.from] = list;
    onSuccess.call(data);
    isloadingRescheduleOrCancel = false;
    notifyListeners();
  }

  onChangeFkUser(String idUser) {
    if (idUser.isEmpty) {
      selectedFkUser = null;
    } else {
      selectedFkUser = idUser;
    }

    notifyListeners();
    getAppointments();
  }

  onChangeFkMainCity(List<String> mainCity) {
    if (mainCity.isEmpty) {
      selectedMainCityFks = null;
    } else {
      selectedMainCityFks = mainCity;
    }
    notifyListeners();
    getAppointments();
  }

  setFkCountry(String fkCountry) {
    this.fkCountry = fkCountry;
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

  void deleteEvent(EventModel event) {
    _events.remove(event);
    notifyListeners();
  }

  void editEvent(EventModel newEvent, EventModel oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;

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

  changeEventToDone({
    required EventModel event,
    required VoidCallback onLoading,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      onLoading();
      final isDone = IsDoneDateEnum.done.index.toString();
      var data = await Api().post(
        url: url +
            "client/invoice/update_date_install.php?idclients_date=${event.idClientsDate}",
        body: {
          "is_done": isDone,
          "fk_client": event.fkIdClient,
          "comment": event.comment,
        },
      );
      final list = eventDataSource[event.from] ?? [];
      final index = list.map((e) => e.from).toList().indexOf(event.from);
      if (index == -1) {
        onFailure();
        return;
      }
      list[index] = list[index].copyWith(
        isDone: isDone,
        fkIdClient: event.fkIdClient,
        comment: event.comment,
      );
      eventDataSource[event.from] = list;
      notifyListeners();
      onSuccess();
    } catch (e) {
      onFailure();
    }
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
