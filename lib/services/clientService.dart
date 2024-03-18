import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:flutter/foundation.dart';

import '../core/utils/end_points.dart';

class ClientService {
  Future<ClientModel1> addClient(Map<String, dynamic?> body) async {
    // try{
    var result = await Api()
        .post(url: EndPoints.baseUrls.url + "client/clientAdd.php", body: body);

    //   return result !="error"? result:"false";}
    // catch(e){
    //
    //   return "false";
    // }
    return ClientModel1.fromJson(result[0]);
  }

  //id_product
  Future<ClientModel1> updateClient(
      Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/clientUpdate.php?id_clients=$idclient",
        body: body);
    return ClientModel1.fromJson(data[0]); // );//=="done"? true:false;
  }

  Future<ClientModel1> setfkuserClient(
      Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/set_fkuser_transfer.php?id_clients=$idclient",
        body: body);
    //client/setApproveClient.php
    return ClientModel1.fromJson(data[0]);
    // result=="done"? true:false;
  }

  Future<bool> setfkuserApprovetransfer(
      Map<String, dynamic> body, String idclient) async {
    String result = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/set_transferApprove.php?id_clients=$idclient",
        body: body);
    //client/setApproveClient.php
    return result == "done" ? true : false;
  }

  List<ClientModel1> convertToClients(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list)
        .map<ClientModel1>((e) => ClientModel1.fromJson(e))
        .toList();
  }

  //
  Future<List<ClientModel1>> getAllClient(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getClientAll.php?fk_country=$fkcountry');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }

  //
  Future<List<ClientModel1>> getClientDateTable(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getClientDateTable.php?fk_country=$fkcountry');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel1>> getClientDateTable_regoin(
      String? fkcountry, String regoin) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclient_accept_regoin.php?fk_country=$fkcountry&regoin=$regoin');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel1>> getClientDateTable_user(String user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclient_accept_user.php?user_id=$user');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel1>> getAllClientsupport(
      String? fkcountry, List<int>? listparam) async {
    List<dynamic> data = [];
    if (listparam != null) {
      String params = '';
      for (int i = 0; i < listparam.length; i++)
        params += '&maincity[]=${listparam[i]}';

      data = await Api().get(
          url: EndPoints.baseUrls.url +
              'client/getclientfilteraccept.php?fk_country=$fkcountry$params');
    } else
      data = await Api().get(
          url: EndPoints.baseUrls.url +
              'client/getclientfilteraccept.php?fk_country=$fkcountry');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel1>> getAllClientmarket(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarketing.php?fk_country=$fkcountry');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel1>> getClientmarket_regoin(String regoin) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarket_regoin.php?fk_regoin=$regoin');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel1>> getClientmarket_user(String user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarket_user.php?fk_user=$user');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<ClientModel1> getclientid(String? id_clients) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientid.php?id_clients=$id_clients');

    return ClientModel1.fromJson(data[0]);
  }

  Future<List<ClientModel1>> getAcceptClient(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getAcceptClient.php?fk_country=$fkcountry');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel1>> getTransfer(String param) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url + 'client/get_approveTransfer.php?$param');

    List<ClientModel1> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel1.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel1>> getClientbyuser(String? fk_user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientbyuser.php?fk_user=$fk_user');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }

  //
  Future<List<ClientModel1>> getAllClientByRegoin(String? regoin) async {
    List<dynamic> data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel1> prodlist =
        await compute<List<dynamic>, List<ClientModel1>>(
            convertToClients, data);
    return prodlist;
  }
}
