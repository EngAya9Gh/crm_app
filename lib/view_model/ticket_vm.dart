



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ticket_vm extends ChangeNotifier{

  List<TicketModel> listticket=[];
  List<TicketModel> listticket_client=[];
  List<TicketModel> listticket_clientprofile=[];
  List<TicketModel> listticket_clientfilter=[];
  List<TicketModel> tickesearchlist=[];
  UserModel? usercurrent;
  bool isloading=false;
  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  //List<String> Typeticket= ['مغلقة','مستلمة','جديدة'];

  int selectedtypeticket=0;

  void changeticket(int s){
    selectedtypeticket=s;
    notifyListeners();
  }
   bool addvalue=false;
  Future<bool> addticket(Map<String, dynamic?> body,String client)async {
    addvalue=true;
    notifyListeners();
  bool isav=  await getclient_ticket_close(client);
  print(isav);
  if(isav){
    var data= await Api()
        .post( url:url+"ticket/add_ticket.php",body:
    body
    );
    TicketModel tm=  TicketModel.fromJson(data[0]);
    listticket.insert(0,tm);
    addvalue=false;
    tickesearchlist.insert(0, tm);//List.from(listticket);
    listticket_clientfilter=List.from(listticket);
    notifyListeners();

  }
    addvalue=false;
  notifyListeners();
    return isav;
  }
  Future<void> searchProducts(
      String productName) async {
    List<TicketModel> ticketlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//

    print('search');
    print(searchKey);
    if(productName.isNotEmpty){
    if(listticket.isNotEmpty ){
      listticket.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          ticketlistsearch.add(element);
      });
      tickesearchlist=ticketlistsearch;
    }}else
      tickesearchlist=listticket;
      notifyListeners();
  }
  Future<bool> updateTicketvm(Map<String, dynamic?> body,String? id_ticket)
  async {
    isloading=true;
    notifyListeners();
    var data = await Api()
        .post(
        url:url+"ticket/recive_ticket.php?id_ticket=$id_ticket",
        body: body
    );
    int index=listticket.indexWhere(
            (element) => element.idTicket==id_ticket);

    listticket[index]=TicketModel.fromJson(data[0]);
    index=tickesearchlist.indexWhere(
            (element) => element.idTicket==id_ticket);
    tickesearchlist[index]=TicketModel.fromJson(data[0]);
    tickesearchlist.removeAt(index);
    isloading=false;
    notifyListeners();
    return true;
  }

  Future<void> setfTicketclient_vm(Map<String, dynamic?> body,String? id_ticket) async {
   isloading=true;
   notifyListeners();
   var data= await Api()
        .post( url:url+"ticket/trasfer_ticket.php?id_ticket=$id_ticket",
        body: body
    );
      int index=listticket.indexWhere(
              (element) => element.idTicket==id_ticket);
    listticket[index]=TicketModel.fromJson(data[0]);
   // listticket.removeAt(index);
   tickesearchlist=List.from( listticket);
   isloading=false;
      notifyListeners();

  }
 Future< void> getclient_ticket(String fkIdClient)async{
    listticket_client=[];
    await getticket();
    //notifyListeners();
    int index=0;
   if(listticket.isNotEmpty){

    listticket.forEach((element) {
    if( element.fkClient==fkIdClient)
    {
      listticket_client.add(element);
      print('vghfggcgbbbbbbbbbbbbbbbbbbbb');
      print(listticket_client[index].nameEnterprise);
      print(fkIdClient);
      index++;
    }
  });
   }
   notifyListeners();
}

  Future<bool> getclient_ticket_close(String client)async{
    await getticket();

    bool isavl=true;
      listticket.forEach((element) {
        if(element.fkClient==client)
          {
            if(element.typeTicket=='جديدة' ||
                element.typeTicket=='قيد التنفيذ')
              isavl=false;
              //return false;
          }
      });

    //notifyListeners();
    return isavl;
  }
 Future<void> getclientticket_filter(String filter)async{
  await getticket();
  if(listticket.isNotEmpty){
    listticket_clientfilter=[];

    listticket.forEach((element) {
      if( element.typeTicket==filter) {
        listticket_clientfilter.add(element);
      }
    });}

    notifyListeners();
}
  void gettypeticket_filter(String filter){
    tickesearchlist=[];
    if(listticket.isNotEmpty){
      switch(filter){
        case '0':
          listticket.forEach((element) {
            if( element.typeTicket=='جديدة') {
              tickesearchlist.add(element);
            }
          });
          break;

        case '1':
          listticket.forEach((element) {
            if( element.typeTicket=='قيد التنفيذ') {
              tickesearchlist.add(element);
            }
          });
          break;
        case '2':
          listticket.forEach((element) {
            if( element.typeTicket=='مغلقة') {
              tickesearchlist.add(element);
            }
          });
          break;
      }

    }

    notifyListeners();
  }
//
Future<void> getticket() async {
  isloading=true;
  notifyListeners();
  var
  data=await Api()
      .get(url:url+ 'ticket/view_ticket.php?fk_country=${usercurrent!.fkCountry}');
   print('tickets print');
   print(data);
  List<TicketModel> prodlist = [];
  for (int i = 0; i < data.length; i++) {
    prodlist.add(TicketModel.fromJson(data[i]));
  }
  listticket=prodlist;
  isloading=false;
  notifyListeners();
}


}