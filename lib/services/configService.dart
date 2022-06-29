

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/reasonmodel.dart';

import '../constants.dart';

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
}}