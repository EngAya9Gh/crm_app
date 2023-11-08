import 'package:crm_smart/core/api/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';
import '../models/distinctive_client.dart';

@injectable
class CommunicationListDatasource {
  final ClientApi _clientApi;

  CommunicationListDatasource(this._clientApi);

  Future<ResponseWrapper<List<DistinctiveClient>>> getCommunicationList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.distinctiveClient,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<DistinctiveClient>>.fromJson(
        response.data,
        (json) => List.from((json as List<dynamic>).map((e) => DistinctiveClient.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }
}
