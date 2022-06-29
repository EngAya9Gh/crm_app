

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/targetmodel.dart';

import '../../../constants.dart';

class targetdata{

  List<TargetModel> list_target=[];
 static Future<List<TargetModel>> gettarget(Map<String,String> body) async {
    var
    data=await Api()
        .post(url:url+ 'target/target_get.php',body: body);
    print(data);
    List<TargetModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      prodlist.add(TargetModel.fromJson(data[i]));
    }
    return prodlist;
  }

}