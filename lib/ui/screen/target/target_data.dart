import 'package:crm_smart/core/services/api/api_services.dart';

import '../../../api/api.dart';
import '../../../core/services/di/di_container.dart';
import '../../../core/utils/end_points.dart';
import '../../../model/branch_race_model.dart';
import '../../../model/targetmodel.dart';

class TargetData {
  List<TargetModel> list_target = [];

  static Future<List<TargetModel>> gettarget(Map<String, String> body) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url + 'target/target_get.php', body: body);

    List<TargetModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      prodlist.add(TargetModel.fromJson(data[i]));
    }
    return prodlist;
  }

  static Future<List<BranchRaceModel>> getTarget() async {
        try {
          var api =await getIt<ApiServices>()..changeBaseUrl(EndPoints.baseUrls.urlLaravel);
          var data=await api.get(endPoint: 'targets');
          List<BranchRaceModel> list = [];
          for (int i = 0; i < data['message'].length; i++) list.add(BranchRaceModel.fromJson(data['message'][i]));
             return list;
        } on Exception catch (e) {
          return [];
        }
  }
}

typedef FromJson<T> = T Function(dynamic json);

List<T> convertListFromJson<T>(List<dynamic> list, FromJson<T> fromJson) {
  return List<dynamic>.from(list).map<T>(fromJson).toList();
}
