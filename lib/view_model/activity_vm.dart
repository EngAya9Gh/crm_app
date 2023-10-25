import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../services/configService.dart';

class ActivityVm extends ChangeNotifier {
  List<ActivityModel> activitiesList = [];

  Future<void> getActivities() async {
    if (activitiesList.isEmpty) activitiesList = await config_service().getactv('type');
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
    int index = activitiesList.indexWhere((element) => element.id_activity_type == s);
    ActivityModel? activity;
    if (index != -1) activity = activitiesList[index];
    onChangeSelectedActivity(activity);
  }

  bool isLoading = false;

  Future<String> addActivityVm(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();
    String res = await Api().post(url: url + 'config/addactv.php', body: body);
    if (res != "error") {
      body.addAll({
        'id_activity_type': res,
      });
      activitiesList.insert(0, ActivityModel.fromJson(body));
      isLoading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> updateActivity(Map<String, dynamic> body, String activityTypeId) async {
    isLoading = true;
    notifyListeners();
    String res = await Api().post(url: url + 'config/update_actv.php?id_activity_type=$activityTypeId', body: body);
    body.addAll({
      'id_activity_type': activityTypeId,
    });
    final index = activitiesList.indexWhere((element) => element.id_activity_type == activityTypeId);
    activitiesList[index] = ActivityModel.fromJson(body);
    isLoading = false;
    notifyListeners();

    return res;
  }
}
