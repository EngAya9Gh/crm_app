import 'package:crm_smart/core/api/api_services.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../models/distinctive_client.dart';

@injectable
class CommunicationListDatasource {
  final ApiServices api;

  CommunicationListDatasource(this.api);

  Future<ResponseWrapper<List<DistinctiveClient>>> getCommunicationList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.client.distinctiveClient, queryParameters: body);

      return ResponseWrapper<List<DistinctiveClient>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>)
            .map((e) => DistinctiveClient.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }
}
