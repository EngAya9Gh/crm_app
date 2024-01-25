import 'dart:convert';

import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/clients_list/data/models/recommended_client.dart';
import '../../../../model/similar_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';
import '../models/clients_list_response.dart';

@injectable
class ClientsListDatasource {
  final ClientApi _clientApi;

  ClientsListDatasource(this._clientApi);

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.allClientsList,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }
  Future<ResponseWrapper<List<SimilarClient>>> getSimilarClientsList(Map<String, dynamic> body) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.similarClientsList,
          data: body,

          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      final client = response.data;//ClientModel.fromJson(response.data);
      List<SimilarClient> listres=List.from((client as List<dynamic>).map((e) {
                  return SimilarClient.fromJson(e as Map<String, dynamic>);
             }));
      return ResponseWrapper<List<SimilarClient>>(message: null, data: listres);

      // return List.from((client as List<dynamic>).map((e) {
      //           return SimilarClient.fromJson(e as Map<String, dynamic>);
      //      }));
      // return ResponseWrapper<List<SimilarClient>>.fromJson(
      //   response.data,
      //   (json) {
      //     return List.from((json as List<dynamic>).map((e) {
      //       return SimilarClient.fromJson(e as Map<String, dynamic>);
      //     }));
      //   },
       //);

    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByRegionList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.clientsByRegionList,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByUserList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.clientsByUserList,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsWithFilterList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.allClientsWithFilter,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RecommendedClient>>> getRecommendedClients() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.care.getRecommendedClients,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<RecommendedClient>>.fromJson(
        jsonDecode(response.data),
        (json) => List.from((json as List<dynamic>).map((e) => RecommendedClient.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> addClient(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.addClient,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      final client = ClientModel.fromJson(response.data['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }


  Future<ResponseWrapper<ClientModel>> editClient1(Map<String, dynamic> body,Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.editClient,
          data: body,
          queryParameters: params,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      final client = ClientModel.fromJson(response.data['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

    Future<ResponseWrapper<ClientModel>> changeTypeClient(Map<String, dynamic> body,Map<String, dynamic> params,String id) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.changeTypeClient+id,
          data: body,
          queryParameters: params,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      final client = ClientModel.fromJson(response.data['data']);
      final client1 =  response.data['success'];
      return ResponseWrapper(message:client, data: client);
    }
    return throwAppException(fun);
  }
  Future<ResponseWrapper<ClientModel>> approveClient_Reject(Map<String, dynamic> body,Map<String, dynamic> params,String id) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.approveClient_reject_admin+id,
          data: body,
          queryParameters: params,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      final client  = ClientModel.fromJson(response.data['data']);
      // final client1 = ClientModel.fromJson( response.data['message']);
      return ResponseWrapper(message:client, data: client);
    }

    return throwAppException(fun);
  }

}
