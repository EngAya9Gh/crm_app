import 'dart:convert';

import 'package:crm_smart/core/api/api_services.dart';
import 'package:crm_smart/features/clients_list/data/models/recommended_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/similar_client.dart';
import '../models/clients_list_response.dart';

@injectable
class ClientsListDatasource {
  final ApiServices api;

  ClientsListDatasource(this.api);

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.client.allClientsList, queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<SimilarClient>>> getSimilarClientsList(
      Map<String, dynamic> body) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
          endPoint: EndPoints.client.similarClientsList, data: body);

      api.changeBaseUrl(EndPoints.baseUrl);
      final client = response; //ClientModel.fromJson(response);
      List<SimilarClient> listres =
          List.from((client as List<dynamic>).map((e) {
        return SimilarClient.fromJson(e as Map<String, dynamic>);
      }));
      return ResponseWrapper<List<SimilarClient>>(message: null, data: listres);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByRegionList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.client.clientsByRegionList,
          queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByUserList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.client.clientsByUserList, queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsWithFilterList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.client.allClientsWithFilter,
          queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RecommendedClient>>>
      getRecommendedClients() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
        endPoint: EndPoints.care.getRecommendedClients,
      );

      return ResponseWrapper<List<RecommendedClient>>.fromJson(
        jsonDecode(response),
        (json) => List.from((json as List<dynamic>)
            .map((e) => RecommendedClient.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> addClient(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.post(
        endPoint: EndPoints.client.addClient,
        data: body,
      );

      final client = ClientModel.fromJson(response['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> editClient1(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.post(
        endPoint: EndPoints.client.editClient,
        data: body,
        queryParameters: params,
      );

      final client = ClientModel.fromJson(response['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> changeTypeClient(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
        endPoint: EndPoints.client.changeTypeClient + id,
        data: body,
        queryParameters: params,
      );

      api.changeBaseUrl(EndPoints.baseUrl);
      final client = ClientModel.fromJson(response['data']);
      final client1 = response['success'];
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> approveClient_Reject(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
        endPoint: EndPoints.client.approveClient_reject_admin + id,
        data: body,
        queryParameters: params,
      );

      api.changeBaseUrl(EndPoints.baseUrl);
      final client = ClientModel.fromJson(response['data']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }
}
