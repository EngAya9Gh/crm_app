import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/targetmodel.dart';

import '../../../core/utils/end_points.dart';
import '../../../model/branch_race_model.dart';

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
    var data =
        await Api().get(url: EndPoints.baseUrls.url + 'target/target_get.php');
    List<BranchRaceModel> list =
        convertListFromJson(data, (json) => BranchRaceModel.fromJson(json));
    return list;
  }
}

typedef FromJson<T> = T Function(dynamic json);

List<T> convertListFromJson<T>(List<dynamic> list, FromJson<T> fromJson) {
  return List<dynamic>.from(list).map<T>(fromJson).toList();
}
