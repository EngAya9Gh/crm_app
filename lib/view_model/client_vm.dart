



import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

const CACHE_ClientByUser_KEY = "CACHE_Client_KEY";
const CACHE_ClientByUser_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

class client_vm extends ChangeNotifier {
  List<ClientModel> listClient = [];
  List<ClientModel> listClientAccept = [];
  List<ClientModel> listClientAprroveTransfer = [];
  List<ClientModel> listClientbyCurrentUser = [];
  List<ClientModel> listClientbyRegoin = [];
  List<ClientModel> listClientfilter = [];
  List<ClientModel> listClientMarketing = [];
  bool isapproved=false;
  // client_vm(UserModel? currentUser){
  //
  //   usercurrent=currentUser;
  //   notifyListeners();
  // }
  clear(){
    listClient=[];
    listClientAccept = [];
    listClientbyCurrentUser = [];
    listClientbyRegoin = [];
    listClientfilter = [];
    listClientMarketing = [];
    notifyListeners();
  }
  UserModel? usercurrent;
  bool isloading=false;
  void setvalue(user){
    print('in set usercurrent client vm');

    usercurrent=user;
    notifyListeners();
  }
  void setvaluepriv(privilgelistparam){
    print('in set privilge client vm');
    privilgelist=privilgelistparam;
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist=[];
  Future<void> getclienttypeInstall()async {

  }
  Future<void> getclient_Local(String searchfilter
    // , List<InvoiceModel> list
      )
  async {
    isloading=true;
    listClientAccept=[];
    // notifyListeners();

    notifyListeners();
    List<ClientModel> _list=
    await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    _list.forEach((element) {
      if( element.typeClient==searchfilter
          && element.isApprove!=null )
        listClientAccept.add(element);
    });
     isloading=false;
     listClient=List.from(listClientAccept);
     notifyListeners();
  }

  bool getfilterclient(String filter){
    UserModel? user;
    listClient.map(
            (e) {
          e.nameEnterprise!.contains(filter);return true;
        }
    );
    return false;
  }
  ClientModel? selectedclient;
  void changevalueclient(ClientModel? s){
    selectedclient=s;
    notifyListeners();
  }
  Future<void> getfilterview(String? regoin)async{
    List<ClientModel> list=[];
   await getclient_Local('مشترك');
    if(regoin!=null){
      if(regoin!='0'){
        listClientAccept.forEach((element) {
          if(element.fkRegoin==regoin)
            list.add(element);
        });
      }
      else{//الكل لفلتر المنطقة
        listClientAccept.forEach((element) {
          if( element.fkcountry==usercurrent!.fkCountry)
            list.add(element);
        });
      }
    }
    listClientAccept=list;
    notifyListeners();
  }
  Future<void> getfilterviewSupport(List<MainCityModel>? listparam)async{
    isloading=true;
    listClientAccept=[];
    List<int> listval=[];
    List<ClientModel> _list=[];
    notifyListeners();
    if(listparam!.isEmpty) _list=  await ClientService()
        .getAllClientsupport(usercurrent!.fkCountry.toString(),null);
    else {

      int idexist = -1;
      print('length'+listparam!.length.toString());
      // if(listparam!.isNotEmpty)
      idexist = listparam.indexWhere((element) => element.id_maincity == '0');
      print(idexist);
      if (idexist != -1)
        _list = await ClientService()
            .getAllClientsupport(usercurrent!.fkCountry.toString(), null);
      else
        {
          for(int i=0;i<listparam.length;i++)
            listval.add(int.parse( listparam[i].id_maincity));
        _list = await ClientService()
            .getAllClientsupport(usercurrent!.fkCountry.toString(), listval);
        }
    }
    _list.forEach((element) {
      if(element.isApprove!=null )
        listClientAccept.add(element);
    });
   //  List<ClientModel> list=[];
   // await getclient_Local('مشترك');
   //  if(regoin!=null){
   //    if(regoin!='0'){
   //      listClientAccept.forEach((element) {
   //        print(element.id_maincity);
   //        print(regoin);
   //        if(element.id_maincity==regoin)
   //          list.add(element);
   //      });
   //    }
   //    else{//الكل لفلتر المنطقة
   //      listClientAccept.forEach((element) {
   //        if( element.fkcountry==usercurrent!.fkCountry)
   //          list.add(element);
   //      });
   //    }
   //  }
   //  listClientAccept=list;
    isloading=false;
    notifyListeners();
  }
  Future<void> getclientfilter_Local(
      String? searchfilter,String type,
      String? filter2,String? filter3
      // , List<ClientModel> list
      )
  async {
    // if(listClient.isEmpty)
    // List<ClientModel> lists=[];

    listClientfilter=[];
    if(type=="3"){
      if(filter2==null){
        if(filter3 !='0')
      listClient.forEach((element) {
        if( element.fkUser==searchfilter&&element.fkRegoin==filter3)
          listClientfilter.add(element);
      });
        else{
          listClient.forEach((element) {
            if( element.fkUser==searchfilter&&element.fkcountry==usercurrent!.fkCountry)
              listClientfilter.add(element);
          });
        }
      }else{
        if(filter3 !='0')
        listClient.forEach((element) {
          if( element.fkUser==searchfilter&&element.typeClient==filter2
              &&element.fkRegoin==filter3)
            listClientfilter.add(element);
        });
        else{
          listClient.forEach((element) {
            if( element.fkUser==searchfilter&&element.typeClient==filter2
                &&element.fkcountry==usercurrent!.fkCountry)
              listClientfilter.add(element);
          });
        }
      }
    }
    if(type=="type"){

      listClient.forEach((element) {
        if( element.typeClient==searchfilter)
          listClientfilter.add(element);
      });
    }
    if(type=="user"){
      print('in user search');
      if(filter2==null){
        listClient.forEach((element) {
      if( element.fkUser==searchfilter)
        listClientfilter.add(element);
    });
      }else{
        listClient.forEach((element) {
          if( element.fkUser==searchfilter&&element.typeClient==filter2)
            listClientfilter.add(element);
        });
      }
    }
    else {
      if(type=="regoin"){
        if(filter2==null) {
          if(searchfilter!='0')
          listClient.forEach((element) {
            if (element.fkRegoin == searchfilter)
              listClientfilter.add(element);
          });
          else{
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry)
                listClientfilter.add(element);
            });
          }
        }else{
          if(searchfilter!='0')
          listClient.forEach((element) {
            if (element.fkRegoin == searchfilter&&element.typeClient==filter2)
              listClientfilter.add(element);
          });
          else{
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry &&element.typeClient==filter2)
                listClientfilter.add(element);
            });
          }
        }
      }
    }

    notifyListeners();
  }
  void resetlist(){

   listClientfilter= listClient;
   notifyListeners();
  }
  Future<void> getallclient()async{
    listClient =
        await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    listClientAccept = listClient;
    notifyListeners();
  }
  Future<void> getallclientAccept()async{
    listClient =
        await ClientService()
            .getAcceptClient(usercurrent!.fkCountry.toString());
    listClientAccept = listClient;
    notifyListeners();
  }
  Future<void> getallclientTransfer()async{
    listClient = await ClientService()
        .getTransfer(usercurrent!.idUser.toString());//=List.from(listClient);
    listClientAprroveTransfer=List.from(listClient);
    notifyListeners();
  }
  Future<void> getallclientAcceptwithprev()async{
    listClient=[];
    bool res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='1').isCheck=='1'?true:false;
    if(res) {
      listClient = listClientAccept;
    }
    else{
      res= privilgelist.firstWhere(
              (element) => element.fkPrivileg=='6').isCheck=='1'?true:false;
      if(res) {
          listClientAccept.forEach((element) {
            if(element.fkUser==usercurrent!.idUser.toString());
            listClient.add(element);
          });
      }else{
        res= privilgelist.firstWhere(
                (element) => element.fkPrivileg=='38').isCheck=='1'?true:false;
        if(res) {
          listClientAccept.forEach((element) {
            if(element.fkRegoin==usercurrent!.fkRegoin.toString());
            listClient.add(element);
          });
        }}}

    listClientAccept = listClient;
    notifyListeners();
  }

  Future<void> getclient_vm() async {
    clear();
    listClientfilter=[];
    isloading=true;
    notifyListeners();
   // if(listClient.isEmpty)
    //main list
    bool res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='8').isCheck=='1'?true:false;
    if(res) {
      listClient =
      await ClientService().getAllClient(usercurrent!.fkCountry.toString());
      listClientfilter = List.from(listClient);
    }
    else {
    res= privilgelist.firstWhere(
            (element) => element.fkPrivileg=='15').isCheck=='1'?true:false;
    if(res) {
      listClient =
      await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
      listClientfilter = List.from(listClient);
    } else{

      res= privilgelist.firstWhere(
              (element) => element.fkPrivileg=='16').isCheck=='1'?true:false;
      if(res) {
        listClient =
        await ClientService().getClientbyuser(usercurrent!.idUser.toString());
        listClientfilter =List.from(listClient);
      }
    }
    }
    //listClient.where((element) => false)
    isloading=false;
    notifyListeners();
  }

  Future<void> get_byIdClient(String idClient) async {

    ClientModel? inv;
    bool res=true;
//errror
   inv= listClient.firstWhere((element) =>
   element.idClients==idClient
       ,orElse:null);
    if(inv==null) {
      inv=await ClientService().getclientid(idClient);
      listClient.add(inv);
    }
      notifyListeners();
  }
  Future<void> getclientMarketing() async {
    //عملائي
    // await get
    listClientMarketing=[];
    notifyListeners();
    listClient= await ClientService()
        .getAllClientmarket(usercurrent!.fkCountry.toString());
    listClientMarketing=List.from(listClient);
    // if(listClient.isNotEmpty){
    //   listClient.forEach((element) {
    //     if (element.ismarketing =='1' )
    //       listClientMarketing.add(element);
    //   } );
    notifyListeners();
    }

  Future<void> getclientByIdUser_vm(List<ClientModel> list) async {
   //عملائي
    listClientbyCurrentUser=[];
    if(list.isNotEmpty){
    list.forEach((element) {
      if( element.fkUser==usercurrent!.idUser)
        listClientbyCurrentUser.add(element);
    });
    }
else{
      //عملائي
      //in low level employee
      listClientbyCurrentUser = await ClientService()
          .getClientbyuser(usercurrent!.idUser.toString());
      listClient=listClientbyCurrentUser;

    }

    // List<ClientModel>? list=await cahe_data_source_client()
    //     .getCache(CACHE_ClientByUser_KEY, CACHE_ClientByUser_INTERVAL);
    //
    // if(listClientbyCurrentUser.isEmpty){
    //   print("inside get from api client");
    //   listClientbyCurrentUser =
    //   await ClientService().getClientbyuser(usercurrent!.idUser.toString());
    //
    //   if(listClientbyCurrentUser!=null) {
    //     print("nukkkkklllll");
    //   await cahe_data_source_client().saveToCache(listClientbyCurrentUser,
    //       CACHE_ClientByUser_KEY);
    //   }
    //   else {
    //     print("elsssssss");
    //   }
    // }else{
    //   if(list!=null){
    //   print('inside get from cache client');
    //   listClientbyCurrentUser.addAll(list);
    //   }
    // }
    notifyListeners();
  }
  Future<void> getclientByRegoin(List<ClientModel> list) async {
    //if(listClientbyRegoin.isEmpty)
    listClientbyRegoin=[];
    if(list.isNotEmpty){
      list.forEach((element) {
        if( element.fkUser==usercurrent!.idUser)
          listClientbyRegoin.add(element);
      });
    }else {
      //get data from db >>> this mean that main list in here initalise
      listClientbyRegoin = await ClientService()
          .getAllClientByRegoin(usercurrent!.fkRegoin.toString());
       listClient=listClientbyRegoin;
    }
    listClientfilter= listClient;
    notifyListeners();
  }

  Future<String> addclient_vm(Map<String, dynamic?> body,String username,String regoin) async {
    ClientModel res = await ClientService().addClient(body);
    //if (res!="false") {
      // body.addAll({
      //   'id_clients':res,
      //   'nameUser':username,
      //   'name_regoin':regoin
      // });

      //listClientbyCurrentUser.insert(0, ClientModel.fromJson(body));
      listClient.insert(0,res);
      listClientfilter.insert(0, res);
      listClientAccept.insert(0, res);
      // ClientModel.fromJson(body));
      notifyListeners();
    //}
    return "done";
  }

  Future<bool> updateclient_vm(Map<String, dynamic?> body,String? id_client) async {
    ClientModel data = await ClientService().updateClient(
        body,id_client!);

    int index= listClient.indexWhere((element) =>
    element.idClients==id_client);

    listClient[index]=data;

    index= listClientfilter.indexWhere((element) =>
    element.idClients==id_client);
   if(index !=-1)
    listClientfilter[index]=data;

   index= listClientAccept.indexWhere((element) =>
    element.idClients==id_client);
   if(index !=-1)
     listClientAccept[index]=data;
      notifyListeners();
    return true;
  }

  Future<bool> setfkUserApprove(Map<String, dynamic?> body,String? id_client) async {
    isapproved=true;
    notifyListeners();
     await ClientService().setfkuserApprovetransfer(
        body,id_client!);
    // int index= listClient.indexWhere((element) =>
    // element.idClients==id_client);
    // if(index!=-1)
    // listClient[index]=data;
    // // index= listClientfilter.indexWhere((element) =>
    // // element.idClients==id_client);
    // // if(index !=-1)
    // //   listClientfilter[index]=data;
    //
    int index= listClientAprroveTransfer.indexWhere((element) =>
     element.idClients==id_client);
    // if(index !=-1)
    //  {
    //    listClientAccept[index]=data;
    listClientAprroveTransfer.removeAt(index);
     // }
     isapproved=false;
    notifyListeners();
    return true;
  }

  void getudate(){
    listClientfilter=listClient;
    notifyListeners();
  }

  Future<bool> setfkUserclient_vm(Map<String, dynamic?> body,String? id_client) async {
  isloading=true;
  notifyListeners();
    bool res = await ClientService()
        .setfkuserClient(body,id_client!);
    // if (res) {
    //   int index=listClient.indexWhere(
    //           (element) => element.idClients==id_client);
    //   listClient.removeAt(index);
  isloading=false;
      notifyListeners();
    // }
    return res;
  }
  //isapproved
  void removeclient(idclient){
    int index=listClient.indexWhere(
            (element) => element.idClients==idclient);

    listClient.removeAt(index);
    notifyListeners();
  }

  Future<void> searchProducts(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if(productName.isNotEmpty ){
      listClientfilter.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientfilter=clientlistsearch;

      // if(clientlistsearch.isEmpty){
      //   list.forEach((element) {
      //     if(element.nameClient!.contains(searchKey,0))
      //       clientlistsearch.add(element);
      //   });
      // }
      //   if(clientlistsearch.isEmpty){
      //     list.forEach((element) {
      //       if(element.mobile!.contains(searchKey,0))
      //         clientlistsearch.add(element);
      //     });
      //   }
    }else getclient_vm();

    notifyListeners();
    //return clientlistsearch;
  }
  Future<void> searchmarket(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//

    if(productName.isNotEmpty ){
      listClientMarketing.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientMarketing=clientlistsearch;

    }else getclientMarketing();

    notifyListeners();
    //return clientlistsearch;
  }
  //listClientAccept
  Future<void> searchclientAccept(
      String productName) async {
    List<ClientModel> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if(productName.isNotEmpty ){
      listClientAccept.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
          clientlistsearch.add(element);
      });
      listClientAccept=clientlistsearch;
    }else getclient_Local('مشترك');
    notifyListeners();
    //return clientlistsearch;
  }
}






