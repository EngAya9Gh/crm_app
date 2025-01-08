import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/ActivityModel.dart';
import '../model/reasonmodel.dart';

class config_service {
  Future<List<ReasonModel>> getreason(String type) async {
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var data = await  apiServices.get(endPoint: EndPoints.reason.getReason, queryParameters: {'type': type});
    List<ReasonModel> prodlist = [];
    for (int i = 0; i < data['message'].length; i++) {
      prodlist.add(ReasonModel.fromJson(data['message'][i]));
    }

    return prodlist;
  }

  Future<List<ActivityModel>> getactv(String type) async {
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var data = await  apiServices.get(endPoint: EndPoints.activities.getActivities);


    List<ActivityModel> prodlist = [];
    for (int i = 0; i < data['message'].length; i++) {
      prodlist.add(ActivityModel.fromJson(data['message'][i]));
    }

    return prodlist;
  }
}
