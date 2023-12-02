import 'dart:collection';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/services/date_installation_service.dart';

// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import '../model/clientmodel.dart';
import 'page_state.dart';

class EventProvider extends ChangeNotifier {
  bool is_save = false;
  List<Event> _events = [];

  List<Event> get events => _events;
  LinkedHashMap<DateTime, List<Event>> eventDataSource = LinkedHashMap();
  DateTime _selectDate = DateTime.now();

  DateTime get selectDate => _selectDate;

  void setDate(DateTime date) => _selectDate = date;

  List<String>? selectedMainCityFks;
  String? selectedFkUser;
  late String fkCountry;

//when click this date show events المرتبيط for this date just
  List<Event> get eventsOfSelectedDate => _events;
  PageState<List<AppointmentModel>> appointmentsState = PageState();

  // List<InvoiceModel> listinvoices = [];
  List<ClientModel> listclient = [];

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

  void setvalueClient(List<ClientModel> list) {
    listclient = list;
    notifyListeners();
  }

  void addEvents(Event event) {
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
        list = await DateInstallationService.getDateInstallationAll(fkCountry: fkCountry);
      }

      appointmentsState = appointmentsState.changeToLoaded(list);

      _events = list.map((e) => e.asEvent()).toList();

      final mapEvents = Map<DateTime, List<Event>>.fromIterable(
        _events,
        key: (item) => (item as Event).from,
        value: (item) => _events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
      );

      eventDataSource = LinkedHashMap<DateTime, List<Event>>(
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

  // Future<void> getevent_vm(// List<PrivilegeModel> privilgelist
  //     ) async {
  //   loadEvents = false;
  //   notifyListeners();
  //   late Event event; //
  //   _events.clear();
  //
  //   listinvoices.forEach((element) {
  //     if (element.dateinstall_task != null &&
  //         (element.isdoneinstall == null || element.isdoneinstall != '0') &&
  //         (element.daterepaly == null)) {
  //       DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
  //           ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
  //           : DateTime.parse(element.dateinstall_task.toString());
  //       
  //       event = Event(
  //           fkIdClient: element.fkIdClient,
  //           title: element.name_enterprise.toString(),
  //           description: 'description',
  //           from: temp,
  //           to: temp.add(Duration(hours: 2)),
  //           idinvoice: element.idInvoice);
  //       addEvents(event);
  //     } else {
  //       if (element.daterepaly != null && element.isdoneinstall == null) {
  //         DateTime temp = DateTime.parse(element.daterepaly.toString()).hour >= 21
  //             ? DateTime.parse(element.daterepaly.toString()).subtract(Duration(hours: 3))
  //             : DateTime.parse(element.daterepaly.toString());
  //         
  //         event = Event(
  //             fkIdClient: element.fkIdClient,
  //             title: element.name_enterprise.toString(),
  //             description: 'description',
  //             from: temp,
  //             to: temp.add(Duration(hours: 2)),
  //             idinvoice: element.idInvoice);
  //         addEvents(event);
  //       }
  //     }
  //   });
  //
  //   final mapEvents = Map<DateTime, List<Event>>.fromIterable(
  //     _events,
  //     key: (item) => (item as Event).from,
  //     value: (item) => _events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
  //   );
  //
  //   eventDataSource = LinkedHashMap<DateTime, List<Event>>(
  //     equals: isSameDay,
  //     hashCode: getHashCode,
  //   )..addAll(mapEvents);
  //   // if(listClient.isEmpty)
  //   //main list
  //   // bool res= privilgelist.firstWhere(
  //   //         (element) => element.fkPrivileg=='8').isCheck=='1'?true:false;
  //   // if(res) {
  //   //   listClient =
  //   //   await ClientService().getAllClient(usercurrent!.fkCountry.toString());
  //   //   listClientfilter = listClient;
  //   // }
  //   // else {
  //   //   res= privilgelist.firstWhere(
  //   //           (element) => element.fkPrivileg=='15').isCheck=='1'?true:false;
  //   //   if(res) {
  //   //     listClient =
  //   //     await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
  //   //     listClientfilter = listClient;
  //   //   } else{
  //   //
  //   //     res= privilgelist.firstWhere(
  //   //             (element) => element.fkPrivileg=='16').isCheck=='1'?true:false;
  //   //     if(res) {
  //   //       listClient =
  //   //       await ClientService().getClientbyuser(usercurrent!.idUser.toString());
  //   //       listClientfilter = listClient;
  //   //     }
  //   //   }
  //   // }
  //   loadEvents = true;
  //   notifyListeners();
  // }

  // Future<void> getevents(String searchfilter, List<MainCityModel> idmaincitysList, String type) async {
  //   late Event event; //
  //   _events.clear();
  //   if (type == 'regoin') {
  //     List<int> listval = [];
  //     int idexist = idmaincitysList.indexWhere((element) => element.id_maincity == '0');
  //     if (idexist == -1) {
  //       for (int i = 0; i < idmaincitysList.length; i++) listval.add(int.parse(idmaincitysList[i].id_maincity));
  //     }
  //     listinvoices.forEach((element) {
  //       if (element.dateinstall_task != null && (element.isdoneinstall != null || element.isdoneinstall != '0')) {
  //         for (int i = 0; i < listval.length; i++)
  //           if (element.id_maincity == listval[i]) {
  //             DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
  //                 ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
  //                 : DateTime.parse(element.dateinstall_task.toString());
  //             
  //             event = Event(
  //                 fkIdClient: element.fkIdClient,
  //                 title: element.name_enterprise.toString(),
  //                 description: 'description',
  //                 from: temp,
  //                 to: temp.add(Duration(hours: 2)),
  //                 idinvoice: element.idInvoice);
  //             addEvents(event);
  //           }
  //       }
  //     });
  //   }
  //
  //   if (type == 'user') {
  //     listinvoices.forEach((element) {
  //       if (element.dateinstall_task != null && (element.isdoneinstall != null || element.isdoneinstall != '0')) {
  //         if (element.fkIdUser == searchfilter) {
  //           DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
  //               ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
  //               : DateTime.parse(element.dateinstall_task.toString());
  //           
  //           event = Event(
  //               fkIdClient: element.fkIdClient,
  //               title: element.name_enterprise.toString(),
  //               description: 'description',
  //               from: temp,
  //               to: temp.add(Duration(hours: 2)),
  //               idinvoice: element.idInvoice);
  //           addEvents(event);
  //         }
  //       }
  //     });
  //   }
  //
  //   notifyListeners();
  // }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Future<void> getevent_Client(String? searchfilter) async {
    late Event event; //
    _events.clear();

    listclient.forEach((element) {
      if (element.idClients == searchfilter) {
        if (element.date_visit_Client != null) {
          DateTime temp = DateTime.parse(element.date_visit_Client.toString()).hour >= 21
              ? DateTime.parse(element.date_visit_Client.toString()).subtract(Duration(hours: 3))
              : DateTime.parse(element.date_visit_Client.toString());
          
          event = Event(
              fkIdClient: element.idClients,
              title: element.nameEnterprise.toString(),
              description: 'description',
              from: temp,
              to: temp.add(Duration(hours: 2)),
              idinvoice: null);
          addEvents(event);
        }
      }
    });

    final mapEvents = Map<DateTime, List<Event>>.fromIterable(
      _events,
      key: (item) => (item as Event).from,
      value: (item) => _events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  Future<void> getevent_AllClient() async {
    late Event event; //
    _events.clear();

    listclient.forEach((element) {
      if (element.date_visit_Client != null) {
        DateTime temp = DateTime.parse(element.date_visit_Client.toString()).hour >= 21
            ? DateTime.parse(element.date_visit_Client.toString()).subtract(Duration(hours: 3))
            : DateTime.parse(element.date_visit_Client.toString());
        
        event = Event(
            fkIdClient: element.idClients,
            title: element.nameEnterprise.toString(),
            description: 'description',
            from: temp,
            to: temp.add(Duration(hours: 2)),
            idinvoice: null);
        addEvents(event);
      }
    });

    final mapEvents = Map<DateTime, List<Event>>.fromIterable(
      _events,
      key: (item) => (item as Event).from,
      value: (item) => _events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  void deleteEvent(Event event) {
    _events.remove(event);
    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
    _events[index] = newEvent;
    notifyListeners();
  }

  changeEventToDone({
    required Event event,
    required VoidCallback onLoading,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      onLoading();
      const isDone = 1;
      var data = await Api().post(
        url: url + "client/invoice/update_date_install.php?idclients_date=${event.idClientsDate}",
        body: {"is_done": isDone.toString()},
      );
      final list = eventDataSource[event.from] ?? [];
      final index = list.indexOf(event);
      if (index == -1) {
        onFailure();
        return;
      }
      list[index] = list[index].copyWith(isDone: true);
      eventDataSource[event.from] = list;
      notifyListeners();
      onSuccess();
    } catch (e) {
      onFailure();
    }
  }

  addEvent(Event event) {
    _events.add(event);

    final mapEvents = Map<DateTime, List<Event>>.fromIterable(
      events,
      key: (item) => (item as Event).from,
      value: (item) => events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }

  checkAndActionEvent(Event event) {
    if (events.any((element) => element.fkIdClient == event.fkIdClient)) {
      _events = _events.map((e) => e.fkIdClient == event.fkIdClient ? event : e).toList();
    } else {
      _events.add(event);
    }

    final mapEvents = Map<DateTime, List<Event>>.fromIterable(
      events,
      key: (item) => (item as Event).from,
      value: (item) => events.where((element) => isSameDay((item as Event).from, element.from)).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);

    notifyListeners();
  }
}
