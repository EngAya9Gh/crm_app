import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/common/models/config_model.dart';
import '../core/utils/end_points.dart';
import '../model/usermodel.dart';

class config_vm extends ChangeNotifier {
  late List<ConfigModel> listofconfig = [];

  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  Future<void> getAllConfig() async {
    listofconfig = [];
    List<dynamic> data = await Api().get(
        url: EndPoints.baseUrls.url +
            'config/getconfigbycountry.php?fk_country=${usercurrent!.fkCountry}');

    for (int i = 0; i < data.length; i++) {
      listofconfig.add(ConfigModel.fromJson(data[i]));
    }

    notifyListeners();
  }

  Future<bool> updateConfig_vm(
      Map<String, dynamic?> body, String idconfig) async {
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'config/updateConfig.php?id_config=$idconfig',
        body: body);
    if (res == 'done') {
      return true;
    }
    return false;
  }
}
