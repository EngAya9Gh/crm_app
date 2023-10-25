import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class PrivilegeProvider extends ChangeNotifier {
  List<PrivilgeModel> privilegeList = [];
  List<PrivilgeModel> privilegeListPage = [];
  UserModel? userCurrent;

  void setCurrentUser(user) {
    userCurrent = user;
    notifyListeners();
  }

  Future<List<PrivilgeModel>> getPrivilege(String level) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'privilge/privGet.php?fk_level=$level');
    List<PrivilgeModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(PrivilgeModel.fromJson(data[i]));
      print(data[i]);
    }
    privilegeList = list;

    notifyListeners();
    return list;
  }

  Future<List<PrivilgeModel>> getPrivilegePage(String level) async {
    List<dynamic> data = [];
    data = await Api().get(url: url + 'privilge/privGet.php?fk_level=$level');
    List<PrivilgeModel> list = [];
    for (int i = 0; i < data.length; i++) {
      list.add(PrivilgeModel.fromJson(data[i]));
      print(data[i]);
    }
    privilegeListPage = list;

    notifyListeners();
    return list;
  }

  Future<String> updatePrivilegeVm(String? privilegeId, String isCheck) async {
    String res =
        await Api().post(url: url + 'privilge/privUpdate.php?id_privg_user=$privilegeId', body: {'is_check': isCheck});
    int index = privilegeListPage.indexWhere((element) => element.isCheck == isCheck);
    notifyListeners();
    return res;
  }

  Future<void> getPrivilegeUserCurrent() async {
    privilegeList = await getPrivilege(userCurrent!.typeLevel.toString());
    notifyListeners();
  }

  bool checkPrivilege(String privilegeId) {
    if (privilegeList.isNotEmpty) {
      return privilegeList.firstWhere((element) => element.fkPrivileg == privilegeId).isCheck == '1';
    }
    return false;
  }
}
