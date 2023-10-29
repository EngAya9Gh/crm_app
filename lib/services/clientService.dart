import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';

class ClientService {
  Future<ClientModel> addClient(Map<String, dynamic?> body) async {
    
    // try{
    var result = await Api().post(url: url + "client/clientAdd.php", body: body);
    
    //   return result !="error"? result:"false";}
    // catch(e){
    //   
    //   return "false";
    // }
    return ClientModel.fromJson(result[0]);
  }

  //id_product
  Future<ClientModel> updateClient(Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(url: url + "client/clientUpdate.php?id_clients=$idclient", body: body);
    return ClientModel.fromJson(data[0]); // );//=="done"? true:false;
  }

  Future<ClientModel> setfkuserClient(Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(url: url + "client/set_fkuser_transfer.php?id_clients=$idclient", body: body);
    //client/setApproveClient.php
    return ClientModel.fromJson(data[0]);
    // result=="done"? true:false;
  }

  Future<bool> setfkuserApprovetransfer(Map<String, dynamic> body, String idclient) async {
    String result = await Api().post(url: url + "client/set_transferApprove.php?id_clients=$idclient", body: body);
    //client/setApproveClient.php
    return result == "done" ? true : false;
  }

  List<ClientModel> convertToClients(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list).map<ClientModel>((e) => ClientModel.fromJson(e)).toList();
  }

  //
  Future<List<ClientModel>> getAllClient(String? fkcountry) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getClientAll.php?fk_country=$fkcountry');

    List<ClientModel> prodlist =
    await compute<List<dynamic>, List<ClientModel>>
      (convertToClients, data);
    return prodlist;
  }
  //
  Future<List<ClientModel>> getClientDateTable(String? fkcountry ) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getClientDateTable.php?fk_country=$fkcountry');

    List<ClientModel> prodlist =
    await compute<List<dynamic>, List<ClientModel>>
      (convertToClients, data);
    return prodlist;
  }
  Future<List<ClientModel>> getClientDateTable_regoin(String? fkcountry,String regoin) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclient_accept_regoin.php?fk_country=$fkcountry&regoin=$regoin');

    List<ClientModel> prodlist =
    await compute<List<dynamic>, List<ClientModel>>
      (convertToClients, data);
    return prodlist;
  }
  Future<List<ClientModel>> getClientDateTable_user( String user) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclient_accept_user.php?user_id=$user');

    List<ClientModel> prodlist =
    await compute<List<dynamic>, List<ClientModel>>
      (convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel>> getAllClientsupport(String? fkcountry, List<int>? listparam) async {
    List<dynamic> data = [];
    if (listparam != null) {
      String params = '';
      for (int i = 0; i < listparam.length; i++) params += '&maincity[]=${listparam[i]}';
      
      
      data = await Api().get(url: url + 'client/getclientfilteraccept.php?fk_country=$fkcountry$params');
    } else
      data = await Api().get(url: url + 'client/getclientfilteraccept.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }

  Future<List<ClientModel>> getAllClientmarket(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'client/getclientmarketing.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }
  Future<List<ClientModel>> getClientmarket_regoin(String regoin) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'client/getclientmarket_regoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }
  Future<List<ClientModel>> getClientmarket_user(String user) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'client/getclientmarket_user.php?fk_user=$user');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }
  Future<ClientModel> getclientid(String? id_clients) async {
    var data = await Api().get(url: url + 'client/getclientid.php?id_clients=$id_clients');

    return ClientModel.fromJson(data[0]);
  }

  Future<List<ClientModel>> getAcceptClient(String? fkcountry) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getAcceptClient.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }

  Future<List<ClientModel>> getTransfer(String? iduser) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'client/get_approveTransfer.php?iduser=$iduser');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    
    return prodlist;
  }

  Future<List<ClientModel>> getClientbyuser(String? fk_user) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'client/getclientbyuser.php?fk_user=$fk_user');
    
    
    List<ClientModel> prodlist = await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  //
  Future<List<ClientModel>> getAllClientByRegoin(String? regoin) async {
    List<dynamic> data = await Api().get(url: url + 'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }
}
