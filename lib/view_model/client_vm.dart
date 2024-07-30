import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';
import '../core/common/models/client_model.dart';
import '../core/utils/end_points.dart';
import '../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../model/maincitymodel.dart';
import '../model/usermodel.dart';
import '../services/clientService.dart';
import 'page_state.dart';

const CACHE_ClientByUser_KEY = "CACHE_Client_KEY";
const CACHE_ClientByUser_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

class ClientProvider extends ChangeNotifier {
  List<ClientModel> listClient = [];
  List<ClientModel> listClientAccept = [];
  List<ClientModel> listClientAprroveTransfer = [];
  List<ClientModel> listClientbyCurrentUser = [];
  List<ClientModel> listClientbyRegoin = [];
  List<ClientModel> listClientfilter = [];
  List<ClientModel> listClientMarketing = [];
  List<ClientModel> listClientMarketingFilter = [];
  bool isapproved = false;

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

  void setvalue(UserModel? user) {
    usercurrent = user;
    notifyListeners();
  }

  Future<void> getclient_Accept(// , List<InvoiceModel> list
      ) async {
    isloading = true;
    listClientAccept = [];

    notifyListeners();
    List<ClientModel> _list = await ClientService()
        .getAcceptClient(usercurrent!.fkCountry.toString());

    isloading = false;
    listClientAccept = List.from(_list);
    listClient = List.from(listClientAccept);
    notifyListeners();
  }

  ClientModel? selectedclient;

  void changevalueclient(ClientModel? s) {
    selectedclient = s;
    notifyListeners();
  }

  Future<void> getfilterviewSupport(List<MainCityModel>? listparam) async {
    isloading = true;
    listClientAccept = [];
    List<int> listval = [];
    List<ClientModel> _list = [];
    notifyListeners();

    listparam?.forEach((element) {
      listval.add(int.parse(element.id_maincity));
    });

    _list = await ClientService()
        .getAllClientsupport(usercurrent!.fkCountry.toString(), listval);

    _list.forEach((element) {
      if (element.isApprove != null) listClientAccept.add(element);
    });
    isloading = false;
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
      final regionCondition =
          region == null ? true : element.fkRegoin == region;
      final typeClientCondition =
          typeClient == null ? true : element.typeClient == typeClient;
      final activityCondition =
          activity == null ? true : element.NameReason_reject == activity;
      final idUserCondition = idUser == null
          ? true
          : element.fkUser == idUser &&
              element.fkcountry == usercurrent!.fkCountry;

      return regionCondition &&
          typeClientCondition &&
          activityCondition &&
          idUserCondition;
    }).toList();

    listClientfilter = filteredListClient;
    listClientMarketing = filteredListClient;

    notifyListeners();
  }

  Future<void> getClientDateTable_vm(PrivilegeCubit privilegeCubit) async {
    isloading = true;
    notifyListeners();
    bool res = privilegeCubit.checkPrivilege('8');
    if (res) {
      listClientAccept = await ClientService()
          .getClientDateTable(usercurrent!.fkCountry.toString());
    } else {
      res = privilegeCubit.checkPrivilege('15');
      if (res) {
        listClientAccept = await ClientService().getClientDateTable_regoin(
            usercurrent!.fkCountry.toString(),
            usercurrent!.fkRegoin.toString());
      } else {
        res = privilegeCubit.checkPrivilege('16');
        if (res) {
          listClientAccept = await ClientService()
              .getClientDateTable_user(usercurrent!.idUser.toString());
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
    listClient = await ClientService()
        .getAcceptClient(usercurrent!.fkCountry.toString());
    listClientAccept = List.from(listClient);
    isloading = false;

    notifyListeners();
  }

  Future<void> getAllClientTransfer() async {
    isloading = true;
    notifyListeners();

    listClient = await ClientService().getTransfer();
    listClientAprroveTransfer = listClient;

    isloading = false;
    notifyListeners();
  }

  Future<void> getallclientAcceptwithprev(PrivilegeCubit privilegeCubit) async {
    listClient = [];
    bool res = privilegeCubit.checkPrivilege('1');
    if (res) {
      listClient = List.from(listClientAccept);
    } else {
      res = privilegeCubit.checkPrivilege('6');
      if (res) {
        listClientAccept.forEach((element) {
          if (element.fkUser == usercurrent!.idUser.toString()) {
            listClient.add(element);
          }
        });
      } else {
        res = privilegeCubit.checkPrivilege('38');
        if (res) {
          listClientAccept.forEach((element) {
            if (element.fkRegoin == usercurrent!.fkRegoin.toString()) {
              listClient.add(element);
            }
          });
        }
      }
    }

    listClientAccept = List.from(listClient);
    notifyListeners();
  }

  Future<void> getclientMarketing_vm(PrivilegeCubit privilegeCubit) async {
    clear();
    listClientfilter = [];
    isloading = true;
    notifyListeners();

    final String allClientPrivilege = '127';
    final String allClientByRegionPrivilege = '128';
    final String allClientByUserPrivilege = '129';

    bool res = privilegeCubit.checkPrivilege(allClientPrivilege);
    if (res) {
      listClient = await ClientService()
          .getAllClientmarket(usercurrent!.fkCountry.toString());
      listClientfilter = List.from(listClient);
    } else {
      res = privilegeCubit.checkPrivilege(allClientByRegionPrivilege);
      if (res) {
        listClient = await ClientService()
            .getClientmarket_regoin(usercurrent!.fkRegoin.toString());
        listClientfilter = List.from(listClient);
      } else {
        res = privilegeCubit.checkPrivilege(allClientByUserPrivilege);
        if (res) {
          listClient = await ClientService()
              .getClientmarket_user(usercurrent!.idUser.toString());
          listClientfilter = List.from(listClient);
        }
      }
    }

    isloading = false;
    notifyListeners();
  }

  PageState<ClientModel?> currentClientModel = PageState();

  Future<void> get_byIdClient(String idClient,
      [ValueChanged<ClientModel>? onData]) async {
    ClientModel? inv;
    try {
      currentClientModel = currentClientModel.changeToLoading;
      notifyListeners();
      inv = await ClientService().getClientById(idClient);
      currentClientModel = currentClientModel.changeToLoaded(inv);
      onData?.call(inv);
      notifyListeners();
    } catch (e) {
      currentClientModel = currentClientModel.changeToFailed;
      // return ClientModel();
    }
  }

  Future<void> getclientMarketing(PrivilegeCubit privilegeCubit) async {
    listClientMarketing = [];
    isloading_marketing = true;
    notifyListeners();
    await getclientMarketing_vm(privilegeCubit);
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

  Future<String> addclient_vm(
      Map<String, dynamic?> body, String username, String regoin) async {
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

      int index =
          listClient.indexWhere((element) => element.idClients == idClient);

      if (index != -1) listClient[index] = data;

      index = listClientfilter
          .indexWhere((element) => element.idClients == idClient);
      if (index != -1) listClientfilter[index] = data;

      index = listClientAccept
          .indexWhere((element) => element.idClients == idClient);
      if (index != -1) listClientAccept[index] = data;

      // get_byIdClient(idClient.toString());
      data = await ClientService().getClientById(idClient);
      // currentClientModel = currentClientModel.changeToLoading;

      // listClient.add(inv);
      // currentClientModel = currentClientModel.changeToLoaded(inv);
      if (currentClientModel.isSuccess) {
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

  Future approveRefuseTransferClient({
    required Map<String, dynamic> body,
    required String idClient,
  }) async {
    isapproved = true;
    notifyListeners();

    try {
      await ClientService().approveRefuseTransferClient(
        body: body,
        idClient: idClient,
      );

      int index = listClientAprroveTransfer
          .indexWhere((element) => element.idClients == idClient);
      listClientAprroveTransfer.removeAt(index);
    } catch (e) {
      log("error in approveRefuseTransferClient => ${e}");
    }

    isapproved = false;
    notifyListeners();
    return true;
  }

  Future<void> searchmarket(
      String productName, PrivilegeCubit privilegeCubit) async {
    List<ClientModel> clientlistsearch = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //

    if (productName.isNotEmpty) {
      listClientMarketing.forEach((element) {
        if (element.nameEnterprise!.contains(searchKey, 0) ||
            element.nameClient!.contains(searchKey, 0) ||
            element.mobile!.contains(searchKey, 0))
          clientlistsearch.add(element);
      });
      listClientMarketing = clientlistsearch;
    } else
      getclientMarketing(privilegeCubit);

    notifyListeners();
    //return clientlistsearch;
  }

  List<ClientModel> listClientAcceptFilter = [];

  void onSearch(String query) {
    final list = List.of(listClientAccept);

    listClientAcceptFilter = list.where((element) {
      return (element.nameEnterprise
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.phone?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (element.nameClient?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();

    notifyListeners();
  }

  Status tagStatus = Status.init;

  Future<void> setTagClient() async {
    tagStatus = Status.loading;
    notifyListeners();

    final client = currentClientModel.data!;
    client.copyWith(
      tag: !(client.tag ?? false),
    );

    try {
      var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/set_tag_client.php?id_clients=${client.idClients}",
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

  onUpdateListsMarketing(ClientModel clientModel) {
    bool isExist =
        listClient.any((element) => element.idClients == clientModel.idClients);
    if (!isExist) {
      listClient.insert(0, clientModel);
    } else {
      listClient = listClient
          .map((e) => e.idClients == clientModel.idClients ? clientModel : e)
          .toList();
    }

    isExist = listClientfilter
        .any((element) => element.idClients == clientModel.idClients);
    if (!isExist) {
      listClientfilter.insert(0, clientModel);
    } else {
      listClientfilter = listClientfilter
          .map((e) => e.idClients == clientModel.idClients ? clientModel : e)
          .toList();
    }

    isExist = listClientAccept
        .any((element) => element.idClients == clientModel.idClients);
    if (!isExist) {
      listClientAccept.insert(0, clientModel);
    } else {
      listClientAccept = listClientAccept
          .map((e) => e.idClients == clientModel.idClients ? clientModel : e)
          .toList();
    }

    isExist = listClientMarketing
        .any((element) => element.idClients == clientModel.idClients);
    if (!isExist) {
      if (clientModel.ismarketing == '1') {
        listClientMarketing.insert(0, clientModel);
      }
    } else {
      if (clientModel.ismarketing == '1') {
        listClientMarketing = listClientMarketing
            .map((e) => e.idClients == clientModel.idClients ? clientModel : e)
            .toList();
      } else {
        listClientMarketing
            .removeWhere((e) => e.idClients == clientModel.idClients);
      }
    }

    isExist = listClientMarketingFilter
        .any((element) => element.idClients == clientModel.idClients);
    if (!isExist) {
      if (clientModel.ismarketing == '1') {
        listClientMarketingFilter.insert(0, clientModel);
      }
    } else {
      if (clientModel.ismarketing == '1') {
        listClientMarketingFilter = listClientMarketingFilter
            .map((e) => e.idClients == clientModel.idClients ? clientModel : e)
            .toList();
      } else {
        listClientMarketingFilter
            .removeWhere((e) => e.idClients == clientModel.idClients);
      }
    }

    notifyListeners();
  }
}
