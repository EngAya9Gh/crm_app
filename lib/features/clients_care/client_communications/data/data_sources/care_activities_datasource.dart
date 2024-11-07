

import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/update_care_activity_usecase.dart';
import '../models/client_activity_model.dart';

@injectable
class CareActivitiesDatasource {
  final ApiServices api;

  CareActivitiesDatasource(this.api);

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllCareActivities(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.care.getActivitiesCare, queryParameters: body);


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


  Future<ResponseWrapper<ClientActivityModel>> updateCareActivity(
      UpdateCareActivityParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
          endPoint: EndPoints.care.updateActivity(params.param()), queryParameters: params.toMap());


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<ClientActivityModel>.fromJson(
        response,
            (json) {
              return ClientActivityModel.fromJson(json as Map<String, dynamic>);
            },
      );

    }

    return throwAppException(fun);
  }


}
