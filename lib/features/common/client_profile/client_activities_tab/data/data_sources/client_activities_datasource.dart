

import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';
@injectable
class ClientActivitiesDatasource {
  final ApiServices api;

  ClientActivitiesDatasource(this.api);

  Future<ResponseWrapper<List<ClientActivityModel>>> getClientActivities(
      Map<String, dynamic> body,String clientId) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      // final response = await api.get(endPoint: EndPoints.care.getActivityByClient(clientId), queryParameters: body);
      final response = await api.get(endPoint: EndPoints.care.getAllActivities, queryParameters: body);


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<ClientActivityModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientActivityModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }




}
