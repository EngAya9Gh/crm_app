
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import '../../domain/use_cases/add_activity_crud_usecase.dart';
import '../../domain/use_cases/update_activity_crud_usecase.dart';
import '../models/activity_type_model.dart';
@injectable
class CrudActivitiesDatasource {
  final ApiServices api;

  CrudActivitiesDatasource(this.api);

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllActivities(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.care.getAllActivities, queryParameters: body);


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


  Future<ResponseWrapper<List<ActivityTypeModel>>> getActivityTypes(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.care.getActivityType, queryParameters: body);


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<ActivityTypeModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ActivityTypeModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<SubscribedClientModel>>> getSubscribedClients(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.client.subscribedClients, queryParameters: body);


      api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<SubscribedClientModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return SubscribedClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }


  Future<ResponseWrapper<ClientActivityModel>> updateActivity(
      UpdateActivityCrudParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
          endPoint: EndPoints.care.updateActivity(params.param()), data: params.toMap());


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

  Future<ResponseWrapper<ClientActivityModel>> addCrudActivity(
      AddActivityCrudParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
          endPoint: EndPoints.care.addActivity, data: params.toMap());


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
