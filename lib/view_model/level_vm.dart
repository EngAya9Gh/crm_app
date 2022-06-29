import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class level_vm extends ChangeNotifier{

  late List<LevelModel> listoflevel=[];
  late String? selectedValueLevel=null;

  void changeVal(String?  val){
    selectedValueLevel=val;
    notifyListeners();
  }
  void clearvalues(){
    listoflevel=[];
    selectedValueLevel=null;
    notifyListeners();

  }

  Future<void> getlevel()async {
    //listoflevel=[];
    if(listoflevel.isEmpty){
    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'config/getLevel.php');
    print(data);
       if(data !=null) {
       for (int i = 0; i < data.length; i++) {
       listoflevel.add(LevelModel.fromJson(data[i]));
       }}
       notifyListeners();
       //return data;
  }
  }
  Future<String> addLevel_vm(Map<String, dynamic?> body) async {
    String res = await Api().post(
        url: url+'privilge/privAdd.php',
        body: body);
    if (res!="error") {
      body.addAll({
        'id_level':res,
      });
      //listoflevel=[];
      listoflevel.add(LevelModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }


}