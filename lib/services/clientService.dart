import 'package:flutter/foundation.dart';

import '../api/api.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/common/models/client_model.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';

class ClientService {
  Future<ClientModel> addClient(Map<String, dynamic> body) async {
    // try{
    var result = await Api()
        .post(url: EndPoints.baseUrls.url + "client/clientAdd.php", body: body);

    //   return result !="error"? result:"false";}
    // catch(e){
    //
    //   return "false";
    // }
    return ClientModel.fromJson(result[0]);
  }

  //id_product
  Future<ClientModel> updateClient(
      Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/clientUpdate.php?id_clients=$idclient",
        body: body);
    return ClientModel.fromJson(data[0]); // );//=="done"? true:false;
  }

  Future<ClientModel> setfkuserClient(
      Map<String, dynamic> body, String idclient) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/set_fkuser_transfer.php?id_clients=$idclient",
        body: body);
    return ClientModel.fromJson(data[0]);
  }

  Future approveRefuseTransferClient({
    required Map<String, dynamic> body,
    required String idClient,
  }) async {
    try {
      ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      await apiServices.post(
        endPoint: "${EndPoints.client.approveRefuseTransferClient}$idClient",
        data: body,
      );
    } on BaseAppException catch (e) {
      debugPrint("error in approveRefuseTransferClient => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in approveRefuseTransferClient => $e");
      rethrow;
    }
  }

  List<ClientModel> convertToClients(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list)
        .map<ClientModel>((e) => ClientModel.fromJson(e))
        .toList();
  }

  //
  Future<List<ClientModel>> getAllClient(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getClientAll.php?fk_country=$fkcountry');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  //
  Future<List<ClientModel>> getClientDateTable(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getClientDateTable.php?fk_country=$fkcountry');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel>> getClientDateTable_regoin(
      String? fkcountry, String regoin) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclient_accept_regoin.php?fk_country=$fkcountry&regoin=$regoin');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel>> getClientDateTable_user(String user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclient_accept_user.php?user_id=$user');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  Future<List<ClientModel>> getAllClientsupport(
      String? fkcountry, List<int>? listparam) async {
    List<dynamic> data = [];
    String params = '';
    if (listparam != null) {
      for (int i = 0; i < listparam.length; i++) {
        params += '&maincity[]=${listparam[i]}';
      }
    }

    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientfilteraccept.php?fk_country=$fkcountry$params');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel>> getAllClientmarket(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarketing.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel>> getClientmarket_regoin(String regoin) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarket_regoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel>> getClientmarket_user(String user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientmarket_user.php?fk_user=$user');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<ClientModel> getClientById(String? id_clients) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: "${EndPoints.client.getClientById}$id_clients",
      );
      final data = apiDataHandler(response);
      return ClientModel.fromJson(data);
    } catch (e) {
      debugPrint("error in getClientById is => $e");
      rethrow;
    }
  }

  Future<List<ClientModel>> getAcceptClient(String? fkcountry) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getAcceptClient.php?fk_country=$fkcountry');

    List<ClientModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ClientModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ClientModel>> getTransfer() async {
    ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await apiServices.get(
      endPoint: EndPoints.client.getTransferClientsWithPrivileges,
    );
    final data = apiDataHandler(response);
    List<ClientModel> clients = data.map<ClientModel>((e) {
      return ClientModel.fromJson(e);
    }).toList();
    return clients;
  }

  Future<List<ClientModel>> getClientbyuser(String? fk_user) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientbyuser.php?fk_user=$fk_user');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }

  //
  Future<List<ClientModel>> getAllClientByRegoin(String? regoin) async {
    List<dynamic> data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/getclientByRegoin.php?fk_regoin=$regoin');

    List<ClientModel> prodlist =
        await compute<List<dynamic>, List<ClientModel>>(convertToClients, data);
    return prodlist;
  }
}
