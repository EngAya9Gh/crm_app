import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../models/distinctive_client.dart';

@injectable
class SpecialClientsDatasource {
  final ApiServices api;

  SpecialClientsDatasource(this.api);

  Future<ResponseWrapper<List<DistinctiveClient>>> getSpecialClients(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
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
