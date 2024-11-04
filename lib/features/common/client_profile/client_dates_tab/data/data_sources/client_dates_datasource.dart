import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../models/client_date_model.dart';

@injectable
class ClientsDatesDatasource {
  final ApiServices api;

  ClientsDatesDatasource(this.api);

  Future<ResponseWrapper<List<ClientDateModel>>> getAllClientsDates(
      Map<String, dynamic> body,String clientId) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.client.getClientDates(clientId), queryParameters: body);


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<ClientDateModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientDateModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }

}
