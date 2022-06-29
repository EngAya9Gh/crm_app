
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class approve_vm extends ChangeNotifier {
  List<ApproveModel> listapprove=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  void removeApproveClient(String idApproveClient){
    int index=listapprove.indexWhere(
            (element) => element.idApproveClient==idApproveClient);

    listapprove.removeAt(index);
    //notifyListeners();

  }
  Future<void> getApprovebyregoin() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/approveClientGet.php?fk_regoin=${usercurrent!.fkRegoin}');
    List<ApproveModel> list=[];

    for (int i = 0; i < data.length; i++) {
      list.add(ApproveModel.fromJson(data[i]));
    }

    listapprove=list;
    print(listapprove);
    notifyListeners();
  }

  Future<void> getApprovebycountry() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'client/approveClientGet.php?fk_country=${usercurrent!.fkCountry}');
    List<ApproveModel> list=[];

    for (int i = 0; i < data.length; i++) {
      list.add(ApproveModel.fromJson(data[i]));
    }
    listapprove=list;

    print(listapprove);
notifyListeners();
  }

}