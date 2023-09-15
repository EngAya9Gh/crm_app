import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/communication_list/data/models/communication_list_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';

@injectable
class CommunicationListDatasource {
  final ClientApi _clientApi;

  CommunicationListDatasource(this._clientApi);

  Future<ResponseWrapper<List<Communication>>> getCommunicationList(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.care.communicationRepeat,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<Communication>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return Communication.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }
}
