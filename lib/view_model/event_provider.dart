import 'dart:collection';

import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';

// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/clientmodel.dart';

class EventProvider extends ChangeNotifier {
  bool is_save = false;
  final List<Event> _events = [];
  bool loadEvents = false;

  List<Event> get events => _events;
  LinkedHashMap<DateTime, List<Event>> eventDataSource = LinkedHashMap();
  DateTime _selectDate = DateTime.now();

  DateTime get selectDate => _selectDate;

  void setDate(DateTime date) => _selectDate = date;

//when click this date show events المرتبيط for this date just
  List<Event> get eventsOfSelectedDate => _events;
  List<InvoiceModel> listinvoices = [];
  List<ClientModel> listclient = [];

  void setvalue_save() {
    is_save = !is_save;
    notifyListeners();
  }

  void setvalue(List<InvoiceModel> list) {
    listinvoices = list;
    notifyListeners();
  }

  void setvalueClient(List<ClientModel> list) {
    listclient = list;
    notifyListeners();
  }

  void addEvents(Event event) {
    _events.add(event);
    notifyListeners();
  }

  Future<void> getevent_vm(// List<PrivilgeModel> privilgelist
      ) async {
    loadEvents = false;
    notifyListeners();
    late Event event; //
    _events.clear();

    listinvoices.forEach((element) {
      if (element.dateinstall_task != null &&
          (element.isdoneinstall == null || element.isdoneinstall != '0') &&
          (element.daterepaly == null)) {
        DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
            ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
            : DateTime.parse(element.dateinstall_task.toString());
        print(element.dateinstall_task);
        event = Event(
            fkIdClient: element.fkIdClient,
            title: element.name_enterprise.toString(),
            description: 'description',
            from: temp,
            to: temp.add(Duration(hours: 2)),
            idinvoice: element.idInvoice);
        addEvents(event);
      } else {
        if (element.daterepaly != null && element.isdoneinstall == null) {
          DateTime temp = DateTime.parse(element.daterepaly.toString()).hour >= 21
              ? DateTime.parse(element.daterepaly.toString()).subtract(Duration(hours: 3))
              : DateTime.parse(element.daterepaly.toString());
          print(element.daterepaly);
          event = Event(
              fkIdClient: element.fkIdClient,
              title: element.name_enterprise.toString(),
              description: 'description',
              from: temp,
              to: temp.add(Duration(hours: 2)),
              idinvoice: element.idInvoice);
          addEvents(event);
        }
      }
    });

    final mapEvents = Map<DateTime, List<Event>>.fromIterable(
      _events,
      key: (item) => (item as Event).from,
      value: (item) => [item as Event],
    );

    eventDataSource = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(mapEvents);
    // if(listClient.isEmpty)
    //main list
    // bool res= privilgelist.firstWhere(
    //         (element) => element.fkPrivileg=='8').isCheck=='1'?true:false;
    // if(res) {
    //   listClient =
    //   await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    //   listClientfilter = listClient;
    // }
    // else {
    //   res= privilgelist.firstWhere(
    //           (element) => element.fkPrivileg=='15').isCheck=='1'?true:false;
    //   if(res) {
    //     listClient =
    //     await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
    //     listClientfilter = listClient;
    //   } else{
    //
    //     res= privilgelist.firstWhere(
    //             (element) => element.fkPrivileg=='16').isCheck=='1'?true:false;
    //     if(res) {
    //       listClient =
    //       await ClientService().getClientbyuser(usercurrent!.idUser.toString());
    //       listClientfilter = listClient;
    //     }
    //   }
    // }
    loadEvents = true;
    notifyListeners();
  }

  Future<void> getevents(String searchfilter, List<MainCityModel> idmaincitysList, String type) async {
    late Event event; //
    _events.clear();
    if (type == 'regoin') {
      List<int> listval = [];
      int idexist = idmaincitysList.indexWhere((element) => element.id_maincity == '0');
      if (idexist == -1) {
        for (int i = 0; i < idmaincitysList.length; i++) listval.add(int.parse(idmaincitysList[i].id_maincity));
      }
      listinvoices.forEach((element) {
        if (element.dateinstall_task != null && (element.isdoneinstall != null || element.isdoneinstall != '0')) {
          for (int i = 0; i < listval.length; i++)
            if (element.id_maincity == listval[i]) {
              DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
                  ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
                  : DateTime.parse(element.dateinstall_task.toString());
              print(element.dateinstall_task);
              event = Event(
                  fkIdClient: element.fkIdClient,
                  title: element.name_enterprise.toString(),
                  description: 'description',
                  from: temp,
                  to: temp.add(Duration(hours: 2)),
                  idinvoice: element.idInvoice);
              addEvents(event);
            }
        }
      });
    }

    if (type == 'user') {
      listinvoices.forEach((element) {
        if (element.dateinstall_task != null && (element.isdoneinstall != null || element.isdoneinstall != '0')) {
          if (element.fkIdUser == searchfilter) {
            DateTime temp = DateTime.parse(element.dateinstall_task.toString()).hour >= 21
                ? DateTime.parse(element.dateinstall_task.toString()).subtract(Duration(hours: 3))
                : DateTime.parse(element.dateinstall_task.toString());
            print(element.dateinstall_task);
            event = Event(
                fkIdClient: element.fkIdClient,
                title: element.name_enterprise.toString(),
                description: 'description',
                from: temp,
                to: temp.add(Duration(hours: 2)),
                idinvoice: element.idInvoice);
            addEvents(event);
          }
        }
      });
    }

    notifyListeners();
  }

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
          print(element.date_visit_Client);
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
        print(element.date_visit_Client);
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
}
