import '../api/api.dart';
import '../core/utils/end_points.dart';
import '../model/ActivityModel.dart';
import '../model/reasonmodel.dart';

class config_service {
  Future<List<ReasonModel>> getreason(String type) async {
    var data = await Api()
        .get(url: EndPoints.baseUrls.url + 'client/getreason.php?type=$type');

    List<ReasonModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(ReasonModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ActivityModel>> getactv(String type) async {
    var data =
        await Api().get(url: EndPoints.baseUrls.url + 'config/getactv.php');

    List<ActivityModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(ActivityModel.fromJson(data[i]));
    }

    return prodlist;
  }
}
