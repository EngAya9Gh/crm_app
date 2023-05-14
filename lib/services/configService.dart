

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/reasonmodel.dart';

import '../constants.dart';
import '../model/ActivityModel.dart';

class config_service{
Future<List<ReasonModel>> getreason(String type) async {
  var
  data=await Api()
      .get(url:url+ 'client/getreason.php?type=$type');
  print(data);
  List<ReasonModel> prodlist = [];
  for (int i = 0; i < data.length; i++) {
    print(i);
    prodlist.add(ReasonModel.fromJson(data[i]));
  }
  print(prodlist);
  return prodlist;
}

Future<List<ActivityModel>> getactv(String type) async {
  var
  data=await Api()
      .get(url:url+ 'config/getactv.php');
  print(data);
  List<ActivityModel> prodlist = [];
  for (int i = 0; i < data.length; i++) {
    print(i);
    prodlist.add(ActivityModel.fromJson(data[i]));
  }
  print(prodlist);
  return prodlist;
}

}