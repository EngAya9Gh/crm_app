import 'package:flutter/cupertino.dart';

import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/ActivityModel.dart';
import '../services/configService.dart';

class ActivityProvider extends ChangeNotifier {
  List<ActivityModel> activitiesList = [];

  Future<void> getActivities({VoidCallback? onSuccess}) async {
    if (activitiesList.isEmpty)
      activitiesList = await config_service().getactv('type');
    onSuccess?.call();
    notifyListeners();
  }

  ActivityModel? selectedActivity;
  String? selectedActivityTypeId;

  initValueOut() => selectedActivity = null;

  void onChangeSelectedActivity(ActivityModel? s) {
    selectedActivity = s;
    notifyListeners();
  }

  void onChangeSelectedActivityTypeId(String? s) {
    selectedActivityTypeId = s;
    int index =
        activitiesList.indexWhere((element) => element.id_activity_type == s);
    ActivityModel? activity;
    if (index != -1) activity = activitiesList[index];
    onChangeSelectedActivity(activity);
  }

  bool isLoading = false;

  Future<String> addActivityVm(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    var res = await  apiServices.post(endPoint: EndPoints.activities.addActivity,data: body);
    if (res['result'] == "success") {
      body.addAll({
        'id_activity_type': res['message']['id_activity_type'],
      });
      activitiesList.insert(0, ActivityModel.fromJson(body));
      isLoading = false;
      notifyListeners();
    }
    return res['result'];
  }

  Future<String> updateActivity(
      Map<String, dynamic> body, String activityTypeId) async {
    isLoading = true;
    notifyListeners();

    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    var data = await  apiServices.post(endPoint: EndPoints.activities.updateActivity(activityTypeId),data: body);
    body.addAll({
      'id_activity_type': int.parse(activityTypeId),
    });
    final index = activitiesList
        .indexWhere((element) => element.id_activity_type == activityTypeId);
    activitiesList[index] = ActivityModel.fromJson(body);
    isLoading = false;
    notifyListeners();

    return data['result'];
  }
}
