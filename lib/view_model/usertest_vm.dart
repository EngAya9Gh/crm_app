import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/model/usertestmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class usertest_vm  extends ChangeNotifier{
  List<UserTestModel> listProduct = [];

  UserModel? usercurrent;
  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }
  bool isloading=false;

  Future<void> getusertest_vm() async {
    listProduct=[];
    isloading = true;
    notifyListeners();
    var data = await Api()
        .get(url: url + 'users/getusertest.php?fk_country=${usercurrent!.fkCountry.toString()}');
    for (int i = 0; i < data.length; i++) {
      listProduct.insert(0, UserTestModel.fromJson(data[i]));
      isloading = false;
      notifyListeners();
    }}
    Future<String> addusertest_vm(Map<String, dynamic?> body) async {
      isloading = true;
      notifyListeners();
      String res = await Api().post(
          url: url + 'users/add_usretest.php', //users/addmangemt.php
          body: body);

      body.addAll({
        'id_usertest': res,
      });

      isloading = false;
      listProduct.insert(0, UserTestModel.fromJson(body));

      notifyListeners();
      return "done";
    }
    Future<bool> updateusertest_vm(Map<String, dynamic?> body,
        String id_usertest) async {
      isloading = true;
      notifyListeners();
      String res = await Api().post(
          url: url + 'users/update_usertest.php?id_usertest=${id_usertest}',
          //users/addmangemt.php
          body: body);

      final index = listProduct.indexWhere(
              (element) => element.id_usertest == id_usertest);
      listProduct[index] = UserTestModel.fromJson(body);
      isloading = false;
      notifyListeners();
      return true;
    }
  }