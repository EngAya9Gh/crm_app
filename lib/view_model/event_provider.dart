import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/model/invoiceModel.dart';
// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;
  DateTime _selectDate = DateTime.now();
  DateTime get selectDate => _selectDate;
  void setDate(DateTime date) => _selectDate = date;
//when click this date show events المرتبيط for this date just
  List<Event> get eventsOfSelectedDate => _events;
  List<InvoiceModel> listinvoices=[];

  void setvalue(List<InvoiceModel> list){
    listinvoices=list;
    notifyListeners();
  }

  void addEvents(Event event) {
    _events.add(event);
    notifyListeners();
  }
  Future<void> getevent_vm(
      // List<PrivilgeModel> privilgelist
      ) async {
    late Event event;//
    _events.clear();

    listinvoices.forEach((element) {
      if(element.dateinstall_task!=null && (element.isdoneinstall==null ||
          element.isdoneinstall!='0')&& (element.daterepaly==null)){
          DateTime temp= DateTime.parse(element.dateinstall_task.toString()).hour>=21
              ? DateTime.parse(element.dateinstall_task.toString())
              .subtract(Duration(hours: 3)): DateTime.parse(element.dateinstall_task.toString());
          print(element.dateinstall_task);
          event=Event(
              fkIdClient: element.fkIdClient,
              title: element.name_enterprise.toString(),
              description: 'description',
              from:  temp,
              to:    temp.add(Duration(hours: 2)),
              idinvoice: element.idInvoice);
          addEvents(event);
      }else{
        if(element.daterepaly!=null&&element.isdoneinstall==null ){
          DateTime temp= DateTime.parse(element.daterepaly.toString()).hour>=21
              ? DateTime.parse(element.daterepaly.toString())
              .subtract(Duration(hours: 3)): DateTime.parse(element.daterepaly.toString());
          print(element.daterepaly);
          event=Event(
              fkIdClient: element.fkIdClient,
              title: element.name_enterprise.toString(),
              description: 'description',
              from:  temp,
              to:    temp.add(Duration(hours: 2)),
              idinvoice: element.idInvoice);
          addEvents(event);
        }
      }
    });
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
    notifyListeners();
  }
  Future<void> getevents( String searchfilter,String type)async{
     late Event event;//
     _events.clear();
      if(type=='regoin'){
         listinvoices.forEach((element) {
           if(element.dateinstall_task!=null && (element.isdoneinstall!=null ||
                       element.isdoneinstall!='0')){
             if(element.id_maincity==searchfilter){
             DateTime temp= DateTime.parse(element.dateinstall_task.toString()).hour>=21
                 ? DateTime.parse(element.dateinstall_task.toString())
                 .subtract(Duration(hours: 3)): DateTime.parse(element.dateinstall_task.toString());
             print(element.dateinstall_task);
             event=Event(
                 fkIdClient: element.fkIdClient,
                 title: element.name_enterprise.toString(),
                 description: 'description',
                 from:  temp,
                 to:    temp.add(Duration(hours: 2)),
                 idinvoice: element.idInvoice);
             addEvents(event);
           }
         }
       });
      }



     if(type=='user'){
       listinvoices.forEach((element) {
         if(element.dateinstall_task!=null && (element.isdoneinstall!=null ||
             element.isdoneinstall!='0')){
           if(element.fkIdUser==searchfilter){
             DateTime temp= DateTime.parse(element.dateinstall_task.toString()).hour>=21
                 ? DateTime.parse(element.dateinstall_task.toString())
                 .subtract(Duration(hours: 3)): DateTime.parse(element.dateinstall_task.toString());
             print(element.dateinstall_task);
             event=Event(
                 fkIdClient: element.fkIdClient,
                 title: element.name_enterprise.toString(),
                 description: 'description',
                 from:  temp,
                 to:    temp.add(Duration(hours: 2)),
                 idinvoice: element.idInvoice);
             addEvents(event);
           }
         }
       });
     }

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
