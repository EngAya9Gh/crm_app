

import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../services/configService.dart';

class activity_vm extends ChangeNotifier {
  List<ActivityModel> list_activity=[];

  Future<void> getactv( ) async {

  // notifyListeners();
    if(list_activity.isEmpty)
  list_activity = await config_service().getactv('type');
  notifyListeners();
}

  late ActivityModel? selectedValueOut=null;
  late String? selectedValue_idact =null;

  initValueOut() => selectedValueOut=null;

  void changevalueOut(ActivityModel? s){
    selectedValueOut=s;
    notifyListeners();
  }
  void changesValue_idact(String? s){
    selectedValue_idact=s;
    int index = list_activity.indexWhere((element) => element.id_activity_type == s);
    ActivityModel? dataa;
    if (index != -1)
      dataa=
      list_activity[index] ;


    // list_activity.firstOrNull(
    //     (element) => element.id_activity_type==s ,
    //     orElse: () =>null
    // );
    changevalueOut(dataa);
    // notifyListeners();
  }

bool isloading=false;
Future<String> addActv_vm(Map<String, dynamic?> body) async {
  isloading =true;
  notifyListeners();
  String res = await Api().post(
      url: url+'config/addactv.php',//users/addmangemt.php
      body: body);
  if (res!="error") {
    body.addAll({
      'id_activity_type':res,
    });
    list_activity.insert(0,ActivityModel.fromJson(body));
    isloading=false;
    notifyListeners();
  }
  return res;
}

  Future<String> update_actv(Map<String, dynamic?> body,
      String id_activity_type ) async {
    //name_mange
    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'config/update_actv.php?id_activity_type=${id_activity_type }',//users/addmangemt.php
        body: body);
    body.addAll({
      'id_activity_type':id_activity_type ,
    });
    final index=list_activity.indexWhere((element)
    => element.id_activity_type==id_activity_type );
    list_activity[index]=ActivityModel.fromJson(body);
    isloading =false;
    notifyListeners();

    return res;
  }
}