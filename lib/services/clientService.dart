import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ClientService{

  Future<ClientModel> addClient( Map<String,dynamic?> body) async {
    print("$body");
   // try{
      var result = await Api()
          .post( url:url+"client/clientAdd.php",
          body: body);
      print(result);
    //   return result !="error"? result:"false";}
    // catch(e){
    //   print(e);
    //   return "false";
    // }
    return ClientModel.fromJson(result[0]);
  }
  //id_product
  Future<ClientModel> updateClient( Map<String,dynamic> body,String idclient) async {
    var data = await Api()
        .post( url:url+"client/clientUpdate.php?id_clients=$idclient",
         body: body );
    return ClientModel.fromJson(data[0]);  // );//=="done"? true:false;
  }

  Future<bool> setfkuserClient( Map<String,dynamic> body,String idclient) async {
    String result = await Api()
        .post( url:url
        +"client/set_fkuser_transfer.php?id_clients=$idclient",
        body: body );
    //client/setApproveClient.php
    return result=="done"? true:false;
  }
  Future<bool> setfkuserApprovetransfer(
      Map<String,dynamic> body,String idclient) async {
    String result = await Api()
        .post( url:url+"client/set_transferApprove.php?id_clients=$idclient",body:
    body
    );
    //client/setApproveClient.php
    return result=="done"? true:false;
  }
  //
  Future<List<ClientModel>> getAllClient(String? fkcountry) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getClientAll.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getAllClientsupport(String? fkcountry,List<int>? listparam) async {
    List<dynamic> data =[];
    if(listparam!=null)
    data=await Api()
        .get(url:url+ 'client/getclientfilteraccept.php?fk_country=$fkcountry&&maincity=$listparam');

   else data=await Api()
        .get(url:url+ 'client/getclientfilteraccept.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getAllClientmarket(String? fkcountry) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclientmarketing.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<ClientModel> getclientid(String? id_clients) async {
    var
    data=await Api()
        .get(url:url+ 'client/getclientid.php?id_clients=$id_clients');

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
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getTransfer(String? iduser) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/get_approveTransfer.php?iduser=$iduser');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<ClientModel>> getClientbyuser(String? fk_user) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/getclientbyuser.php?fk_user=$fk_user');
    print('before data');
     print(data);
    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {

      print(data[i]);
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  //
  Future<List<ClientModel>> getAllClientByRegoin(String? regoin) async {
    List<dynamic> data = await Api()
        .get(url:url+ 'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }
    return prodlist;
  }
}