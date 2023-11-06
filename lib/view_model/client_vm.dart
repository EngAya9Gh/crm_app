import 'package:crm_smart/Repository/invoice_repo/cach_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:crm_smart/services/clientService.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../api/api.dart';
import '../constants.dart';
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
  List<ClientModel> listClientMarketingFilter = [];
  bool isapproved = false;

  // client_vm(UserModel? currentUser){
  //
  //   usercurrent=currentUser;
  //   notifyListeners();
  // }
  clear() {
    listClient = [];
    listClientAccept = [];
    listClientbyCurrentUser = [];
    listClientbyRegoin = [];
    listClientfilter = [];
    listClientMarketing = [];
    listClientMarketingFilter = [];
    notifyListeners();
  }

  UserModel? usercurrent;
  bool isloading = false;
  bool isloading_marketing = false;

  void setvalue(user) {
    print('in set usercurrent client vm');

    usercurrent = user;
    notifyListeners();
  }

  void setvaluepriv(privilgelistparam) {
    print('in set privilge client vm');
    privilgelist = privilgelistparam;
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist = [];

  Future<void> getclienttypeInstall() async {}

  Future<void> getclient_Local(String searchfilter
      // , List<InvoiceModel> list
      ) async {
    isloading = true;
    listClientAccept = [];
    // notifyListeners();

    notifyListeners();
    List<ClientModel> _list = await ClientService().getAcceptClient(usercurrent!.fkCountry.toString());
    _list.forEach((element) {
      if (element.typeClient == searchfilter && element.isApprove != null) listClientAccept.add(element);
    });
    isloading = false;
    listClient = List.from(listClientAccept);
    notifyListeners();
  }

  bool getfilterclient(String filter) {
    UserModel? user;
    listClient.map((e) {
      e.nameEnterprise!.contains(filter);
      return true;
    });
    return false;
  }

  ClientModel? selectedclient;

  void changevalueclient(ClientModel? s) {
    selectedclient = s;
    notifyListeners();
  }

  Future<void> getfilterview(String? regoin) async {
    List<ClientModel> list = [];
    await getclient_Local('مشترك');
    if (regoin != null) {
      if (regoin != '0') {
        listClientAccept.forEach((element) {
          if (element.fkRegoin == regoin) list.add(element);
        });
      } else {
        //الكل لفلتر المنطقة
        listClientAccept.forEach((element) {
          if (element.fkcountry == usercurrent!.fkCountry) list.add(element);
        });
      }
    }
    listClientAccept = list;
    notifyListeners();
  }

  Future<void> getfilterviewSupport(List<MainCityModel>? listparam) async {
    isloading = true;
    listClientAccept = [];
    List<int> listval = [];
    List<ClientModel> _list = [];
    notifyListeners();
    if (listparam!.isEmpty)
      _list = await ClientService().getAllClientsupport(usercurrent!.fkCountry.toString(), null);
    else {
      int idexist = -1;
      print('length' + listparam.toString().length.toString());
      // if(listparam!.isNotEmpty)
      idexist = listparam.indexWhere((element) => element.id_maincity == '0');
      print(idexist);
      if (idexist != -1)
        _list = await ClientService().getAllClientsupport(usercurrent!.fkCountry.toString(), null);
      else {
        for (int i = 0; i < listparam.length; i++) listval.add(int.parse(listparam[i].id_maincity));

        _list = await ClientService().getAllClientsupport(usercurrent!.fkCountry.toString(), listval);
      }
    }
    _list.forEach((element) {
      if (element.isApprove != null) listClientAccept.add(element);
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
    isloading = false;
    notifyListeners();
  }

  @Deprecated('use function filterClientMarketingSalesList instead of this.')
  Future<void> getclientfilter_Local(
      String? searchfilter, String type, String? filter2, String? filter3, String? filteractivity
      // , List<ClientModel> list
      ) async {
    listClientfilter = [];
    if (type == "3") {
      if (filter2 == null) {
        if (filter3 != '0')
          listClient.forEach((element) {
            if (element.fkUser == searchfilter && element.fkRegoin == filter3) listClientfilter.add(element);
          });
        else {
          listClient.forEach((element) {
            if (element.fkUser == searchfilter && element.fkcountry == usercurrent!.fkCountry)
              listClientfilter.add(element);
          });
        }
      } else {
        if (filter3 != '0')
          listClient.forEach((element) {
            if (element.fkUser == searchfilter && element.typeClient == filter2 && element.fkRegoin == filter3)
              listClientfilter.add(element);
          });
        else {
          listClient.forEach((element) {
            if (element.fkUser == searchfilter &&
                element.typeClient == filter2 &&
                element.fkcountry == usercurrent!.fkCountry) listClientfilter.add(element);
          });
        }
      }
      listClientMarketing = List.from(listClientfilter);
    }
    if (type == "type") {
      listClient.forEach((element) {
        if (element.typeClient == searchfilter) listClientfilter.add(element);
      });
      listClientMarketing = List.from(listClientfilter);
    }
    if (type == "user") {
      print('in user search');
      if (filter2 == null) {
        listClient.forEach((element) {
          if (element.fkUser == searchfilter) listClientfilter.add(element);
        });
      } else {
        listClient.forEach((element) {
          if (element.fkUser == searchfilter && element.typeClient == filter2) listClientfilter.add(element);
        });
      }
      listClientMarketing = List.from(listClientfilter);
    } else {
      if (type == "regoin") {
        if (filter2 == null) {
          if (searchfilter != '0')
            listClient.forEach((element) {
              if (element.fkRegoin == searchfilter) listClientfilter.add(element);
            });
          else {
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry) listClientfilter.add(element);
            });
          }
        } else {
          if (searchfilter != '0')
            listClient.forEach((element) {
              if (element.fkRegoin == searchfilter && element.typeClient == filter2) listClientfilter.add(element);
            });
          else {
            listClient.forEach((element) {
              if (element.fkcountry == usercurrent!.fkCountry && element.typeClient == filter2)
                listClientfilter.add(element);
            });
          }
        }
      }
      listClientMarketing = List.from(listClientfilter);
    }
    if (filteractivity != '') {
      List<ClientModel> listclientfilterTemp = [];

      if (listClientfilter.isNotEmpty) {
        listClientfilter.forEach((element) {
          if (element.activity_type_fk == filteractivity) listclientfilterTemp.add(element);
        });
        //
      } else {
        listClient.forEach((element) {
          if (element.activity_type_fk == filteractivity) listclientfilterTemp.add(element);
        });
      }
      listClientfilter = List.from(listclientfilterTemp);
      listClientMarketing = List.from(listclientfilterTemp);
    }
    notifyListeners();
  }

  filterClientMarketingSalesList({
    String? region,
    String? activity,
    String? idUser,
    String? typeClient,
  }) {
    final list = List<ClientModel>.from(listClientMarketingFilter).toList();

    if (region == '0') {
      region = null;
    }

    if (typeClient == 'الكل') {
      typeClient = null;
    }

    if (activity == '') {
      activity = null;
    }

    final filteredListClient = list.where((element) {
      final regionCondition = region == null ? true : element.fkRegoin == region;
      final typeClientCondition = typeClient == null ? true : element.typeClient == typeClient;
      final activityCondition = activity == null ? true : element.activity_type_fk == activity;
      final idUserCondition =
          idUser == null ? true : element.fkUser == idUser && element.fkcountry == usercurrent!.fkCountry;

      return regionCondition && typeClientCondition && activityCondition && idUserCondition;
    }).toList();

    listClientfilter = filteredListClient;
    listClientMarketing = filteredListClient;

    notifyListeners();
  }

  filterClient({
    String? region,
    String? activity,
    String? idUser,
    String? typeClient,
  }) {
    final list = List<ClientModel>.from(listClient).toList();

    if (region == '0') {
      region = null;
    }

    if (typeClient == 'الكل') {
      typeClient = null;
    }

    if (activity == '') {
      activity = null;
    }

    final filteredListClient = list.where((element) {
      final regionCondition = region == null ? true : element.fkRegoin == region;
      final typeClientCondition = typeClient == null ? true : element.typeClient == typeClient;
      final activityCondition = activity == null ? true : element.activity_type_fk == activity;
      final idUserCondition =
          idUser == null ? true : element.fkUser == idUser && element.fkcountry == usercurrent!.fkCountry;

      return regionCondition && typeClientCondition && activityCondition && idUserCondition;
    }).toList();

    listClientfilter = filteredListClient;
    listClientMarketing = filteredListClient;

    notifyListeners();
  }

  void resetlist() {
    listClientfilter = List.from(listClient);
    notifyListeners();
  }

  Future<void> getallclient() async {
    isloading = true;
    notifyListeners();
    // if(listClient.isEmpty)
    listClient = await ClientService().getAllClient(usercurrent!.fkCountry.toString());
    listClientAccept = List.from(listClient);
    isloading = false;

    notifyListeners();
  }

  Future<void> getClientDateTable_vm() async {
    isloading = true;
    notifyListeners();
    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == '8').isCheck == '1' ? true : false;
    if (res) {
      listClientAccept = await ClientService().getClientDateTable(usercurrent!.fkCountry.toString());
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == '15').isCheck == '1' ? true : false;
      if (res) {
        listClientAccept = await ClientService()
            .getClientDateTable_regoin(usercurrent!.fkCountry.toString(), usercurrent!.fkRegoin.toString());
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == '16').isCheck == '1' ? true : false;
        if (res) {
          listClientAccept = await ClientService().getClientDateTable_user(usercurrent!.idUser.toString());
        }
      }
    }
    // if(listClient.isEmpty)

    // listClientAccept =List.from(listClient) ;
    isloading = false;

    notifyListeners();
  }

  Future<void> getallclientAccept() async {
    listClientAccept = [];
    isloading = true;
    notifyListeners();
    listClient = await ClientService().getAcceptClient(usercurrent!.fkCountry.toString());
    listClientAccept = List.from(listClient);
    isloading = false;

    notifyListeners();
  }

  Future<void> getallclientTransfer() async {
    isloading = true;
    notifyListeners();
    String param='';
    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == '150').isCheck == '1' ? true : false;
    if(res) param='id_regoin= '+ usercurrent!.fkRegoin.toString();
    else param='iduser='+ usercurrent!.idUser.toString();
    listClient = await ClientService().getTransfer(param); //=List.from(listClient);
    listClientAprroveTransfer = List.from(listClient);
    isloading = false;

    notifyListeners();
  }
     
  Future<void> getallclientAcceptwithprev() async {
    listClient = [];
    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == '1').isCheck == '1' ? true : false;
    if (res) {
      listClient = List.from(listClientAccept);
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == '6').isCheck == '1' ? true : false;
      if (res) {
        listClientAccept.forEach((element) {
          if (element.fkUser == usercurrent!.idUser.toString()) ;
          listClient.add(element);
        });
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == '38').isCheck == '1' ? true : false;
        if (res) {
          listClientAccept.forEach((element) {
            if (element.fkRegoin == usercurrent!.fkRegoin.toString()) ;
            listClient.add(element);
          });
        }
      }
    }

    listClientAccept = List.from(listClient);
    notifyListeners();
  }

  Future<void> getclient_vm( ) async {
    clear();
    listClientfilter = [];
    isloading = true;
    notifyListeners();

    final String allClientPrivilege =   '8';
    final String allClientByRegionPrivilege =  '15';
    final String allClientByUserPrivilege =   '16';

    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientPrivilege).isCheck == '1' ? true : false;
    if (res) {
      listClient = await ClientService().getAllClient(usercurrent!.fkCountry.toString());
      listClientfilter = List.from(listClient);
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientByRegionPrivilege).isCheck == '1' ? true : false;
      if (res) {
        listClient = await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
        listClientfilter = List.from(listClient);
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientByUserPrivilege).isCheck == '1' ? true : false;
        if (res) {
          listClient = await ClientService().getClientbyuser(usercurrent!.idUser.toString());
          listClientfilter = List.from(listClient);
        }
      }
    }

    isloading = false;
    notifyListeners();
  }

  Future<void> getclientMarketing_vm( ) async {
    clear();
    listClientfilter = [];
    isloading = true;
    notifyListeners();

    final String allClientPrivilege = '127' ;
    final String allClientByRegionPrivilege = '128' ;
    final String allClientByUserPrivilege =  '129' ;

    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientPrivilege).isCheck == '1' ? true : false;
    if (res) {
      listClient = await ClientService().getAllClientmarket(usercurrent!.fkCountry.toString());
      listClientfilter = List.from(listClient);
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientByRegionPrivilege).isCheck == '1' ? true : false;
      if (res) {
        listClient = await ClientService().getClientmarket_regoin(usercurrent!.fkRegoin.toString());
        listClientfilter = List.from(listClient);
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == allClientByUserPrivilege).isCheck == '1' ? true : false;
        if (res) {
          listClient = await ClientService().getClientmarket_user(usercurrent!.idUser.toString());
          listClientfilter = List.from(listClient);
        }
      }
    }

    isloading = false;
    notifyListeners();
  }

  PageState<ClientModel?> currentClientModel = PageState();

  Future<void> get_byIdClient(String idClient, [ValueChanged<ClientModel>? onData]) async {
    ClientModel? inv;
    try {
      currentClientModel = currentClientModel.changeToLoading;
      notifyListeners();

      // inv = listClient.firstWhereOrNull((element) => element.idClients == idClient);

        // if (inv == null) {
      inv  = await ClientService().getclientid(idClient);
      // currentClientModel = currentClientModel.changeToLoading;

      // listClient.add(inv);
        currentClientModel = currentClientModel.changeToLoaded(inv);
      onData?.call(inv);
      // } else {
      //   currentClientModel = currentClientModel.changeToLoaded(inv);
      // }
      notifyListeners();
      // return inv;
    } catch (e) {
      currentClientModel = currentClientModel.changeToFailed;
      // return ClientModel();
    }
  }

  Future<void> getclientMarketing() async {
    listClientMarketing = [];
    isloading_marketing = true;
    notifyListeners();
    await getclientMarketing_vm();
    if (listClient.isNotEmpty) {
      listClient.forEach((element) {
        if (element.ismarketing == '1') {
          listClientMarketing.add(element);
          listClientMarketingFilter.add(element);
        }
      });
    }

    isloading_marketing = false;
    notifyListeners();
  }

  Future<void> getclientByIdUser_vm(List<ClientModel> list) async {
    //عملائي
    listClientbyCurrentUser = [];
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fkUser == usercurrent!.idUser) listClientbyCurrentUser.add(element);
      });
    } else {
      //عملائي
      //in low level employee
      listClientbyCurrentUser = await ClientService().getClientbyuser(usercurrent!.idUser.toString());
      listClient = listClientbyCurrentUser;
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
    listClientbyRegoin = [];
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fkUser == usercurrent!.idUser) listClientbyRegoin.add(element);
      });
    } else {
      //get data from db >>> this mean that main list in here initalise
      listClientbyRegoin = await ClientService().getAllClientByRegoin(usercurrent!.fkRegoin.toString());
      listClient = listClientbyRegoin;
    }
    listClientfilter = listClient;
    notifyListeners();
  }

  Future<String> addclient_vm(Map<String, dynamic?> body, String username, String regoin) async {
    ClientModel res = await ClientService().addClient(body);
    //if (res!="false") {
    // body.addAll({
    //   'id_clients':res,
    //   'nameUser':username,
    //   'name_regoin':regoin
    // });

    //listClientbyCurrentUser.insert(0, ClientModel.fromJson(body));
    listClient.insert(0, res);
    listClientfilter.insert(0, res);
    listClientAccept.insert(0, res);
    listClientMarketing.insert(0, res);
    listClientMarketingFilter.insert(0, res);
    // ClientModel.fromJson(body));
    notifyListeners();
    //}
    return "done";
  }

  Future<bool> updateclient_vm(Map<String, dynamic?> body, String? idClient,
      {ValueChanged<ClientModel>? onSuccess}) async {
    try {
      isloading = true;
      notifyListeners();
      ClientModel data = await ClientService().updateClient(body, idClient!);

      int index = listClient.indexWhere((element) => element.idClients == idClient);

      if (index != -1) listClient[index] = data;

      index = listClientfilter.indexWhere((element) => element.idClients == idClient);
      if (index != -1) listClientfilter[index] = data;

      index = listClientAccept.indexWhere((element) => element.idClients == idClient);
      if (index != -1) listClientAccept[index] = data;

       // get_byIdClient(idClient.toString());
      data  = await ClientService().getclientid(idClient);
      // currentClientModel = currentClientModel.changeToLoading;

      // listClient.add(inv);
      // currentClientModel = currentClientModel.changeToLoaded(inv);
      if(currentClientModel.isSuccess){
        currentClientModel = currentClientModel.changeToLoaded(data);
      }
      isloading = false;
      notifyListeners();
      onSuccess?.call(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setfkUserApprove(Map<String, dynamic?> body, String? idClient) async {
    isapproved = true;
    notifyListeners();
    await ClientService().setfkuserApprovetransfer(body, idClient!);
    // int index= listClient.indexWhere((element) =>
    // element.idClients==id_client);
    // if(index!=-1)
    // listClient[index]=data;
    // // index= listClientfilter.indexWhere((element) =>
    // // element.idClients==id_client);
    // // if(index !=-1)
    // //   listClientfilter[index]=data;
    //
    int index = listClientAprroveTransfer.indexWhere((element) => element.idClients == idClient);
    // if(index !=-1)
    //  {
    //    listClientAccept[index]=data;
    listClientAprroveTransfer.removeAt(index);
    // }
    isapproved = false;
    notifyListeners();
    return true;
  }

  void getudate() {
    listClientfilter = listClient;
    notifyListeners();
  }

  Future<void> setfkUserclient_vm(Map<String, dynamic?> body, String? idClient) async {
    isloading = true;
    notifyListeners();
    ClientModel res = await ClientService().setfkuserClient(body, idClient!);

    int index = listClient.indexWhere((element) => element.idClients == idClient);
    if (index != -1) listClient[index] = res;

    isloading = false;
    notifyListeners();
  }

  //isapproved
  void removeclient(idclient) {
    int index = listClient.indexWhere((element) => element.idClients == idclient);

    listClient.removeAt(index);
    notifyListeners();
  }

  Future<void> searchProducts(String productName) async {
    List<ClientModel> clientlistsearch = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if (productName.isNotEmpty) {
      listClientfilter.forEach((element) {
        if (element.nameEnterprise!.contains(searchKey, 0) ||
            element.nameClient!.contains(searchKey, 0) ||
            element.mobile!.contains(searchKey, 0)) clientlistsearch.add(element);
      });
      listClientfilter = clientlistsearch;

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
    } else
      getclient_vm();

    notifyListeners();
    //return clientlistsearch;
  }

  Future<void> searchmarket(String productName) async {
    List<ClientModel> clientlistsearch = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //

    if (productName.isNotEmpty) {
      listClientMarketing.forEach((element) {
        if (element.nameEnterprise!.contains(searchKey, 0) ||
            element.nameClient!.contains(searchKey, 0) ||
            element.mobile!.contains(searchKey, 0)) clientlistsearch.add(element);
      });
      listClientMarketing = clientlistsearch;
    } else
      getclientMarketing();

    notifyListeners();
    //return clientlistsearch;
  }

  //listClientAccept
  Future<void> searchclientAccept(String productName) async {
    List<ClientModel> clientlistsearch = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    // productName[0].toUpperCase() +
    //   productName.substring(1);

    if (productName.isNotEmpty) {
      listClientAccept.forEach((element) {
        if (element.nameEnterprise!.contains(searchKey, 0) ||
            element.nameClient!.contains(searchKey, 0) ||
            element.mobile!.contains(searchKey, 0)) clientlistsearch.add(element);
      });
      listClientAccept = clientlistsearch;
    } else
      getclient_Local('مشترك');
    notifyListeners();
    //return clientlistsearch;
  }

  List<ClientModel> listClientAcceptFilter = [];

  void onSearch(String query) {
    final list = List.of(listClientAccept);

    listClientAcceptFilter = list.where((element) {
      return (element.nameEnterprise?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.phone?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.nameClient?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    notifyListeners();
  }

  List<ClientModel> listClientFilterSearch = [];

  void onSearchListClientFilter(String query) {
    final list = List.of(listClientfilter);

    listClientFilterSearch = list.where((element) {
      return (element.nameEnterprise?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.phone?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.nameClient?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    notifyListeners();
  }

  Status tagStatus = Status.init;

  Future<void> setTagClient() async {
    tagStatus = Status.loading;
    notifyListeners();

    final client = currentClientModel.data!;
    client.tag = !(client.tag ?? false);

    try {
      var data = await Api().post(
        url: url + "client/set_tag_client.php?id_clients=${client.idClients}",
        body: {"tag": client.tag.toString()},
      );

      tagStatus = Status.loaded;
      listClient = listClient.map((e) {
        if (e.idClients == client.idClients) {
          return client;
        }
        return e;
      }).toList();

      currentClientModel = currentClientModel.changeToLoading;
      notifyListeners();
      currentClientModel = currentClientModel.changeToLoaded(client);
      notifyListeners();
    } catch (e) {
      tagStatus = Status.failed;
      notifyListeners();
    }
  }
}
