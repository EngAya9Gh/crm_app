import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class level_vm extends ChangeNotifier{

  // late List<LevelModel> listoflevel_periorty=[];
  // late String? selectedValueLevel=null;
  // void changeVal(String?  val){
  //   selectedValueLevel=val;
  //   notifyListeners();
  // }

  // void setvalue(user) {
  //   usercurrent = user;
  //   notifyListeners();
  // }

  // Future<void> getlevel()async {
  //   //listoflevel=[];
  //   if (listoflevel.isEmpty) {
  //     List<dynamic> data = [];
  //     data = await Api()
  //         .get(url: url + 'config/getLevel.php');
  //
  //     if (data != null) {
  //       for (int i = 0; i < data.length; i++) {
  //         listoflevel.add(LevelModel.fromJson(data[i]));
  //       }
  //     }
  //     get_periorty();
  //     notifyListeners();
  //     //return data;
  //   }
  // }
  // void get_periorty()
  // {
  //   listoflevel_periorty=[];
  //   notifyListeners();
  //   switch(usercurrent!.periorty.toString()) {
  //
  //     case '0' :
  //       listoflevel_periorty=List.from(listoflevel);
  //       break;
  //     case '1' :
  //       listoflevel_periorty=listoflevel.where(
  //               (element) => element.periorty!='0'
  //       ).toList();
  //       break;
  //     case '2' :
  //       listoflevel_periorty=listoflevel.where(
  //               (element) => element.periorty!='0' && element.periorty!='1'
  //       ).toList();
  //       break;
  //     case '3' :
  //       listoflevel_periorty=listoflevel.where(
  //               (element) => element.periorty!='0' && element.periorty!='1' && element.periorty!='2'
  //       ).toList();
  //       break;
  //   }
  //   // notifyListeners();
  // }


  // Future<String> addLevel_vm(Map<String, dynamic?> body) async {
  //   String res = await Api().post(
  //       url: url+'privilge/privAdd.php',
  //       body: body);
  //   if (res!="error") {
  //     body.addAll({
  //       'id_level':res,
  //     });
  //     //listoflevel=[];
  //     listoflevel.add(LevelModel.fromJson(body));
  //     notifyListeners();
  //   }
  //   return res;
  // }


}