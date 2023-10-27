import 'package:crm_smart/core/api/client.dart';
import 'package:dio/dio.dart';
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
}
