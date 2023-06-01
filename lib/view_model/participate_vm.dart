

import 'package:crm_smart/model/participatModel.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';

class participate_vm extends ChangeNotifier {
  List<ParticipateModel> list_paricipate=[];

  Future<void> get_participate( ) async {

   var data
      =await Api()
        .get(url:url+ 'agent/get_participate.php');

    print(data);
    List<ParticipateModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      print(i);
      prodlist.add(ParticipateModel.fromJson(data[i]));
    }
   list_paricipate=prodlist;
    notifyListeners();
  }

  late String? selectedValueOut=null;
  void changevalueOut(String? s){
    selectedValueOut=s;
    notifyListeners();
  }

  bool isloading=false;
  Future<String> addparticipate_vm(Map<String, dynamic?> body) async {
    isloading =true;
    notifyListeners();
    String res = await Api().post(
        url: url+'agent/addparticipate.php',//users/addmangemt.php

        body: body);
    if (res!="error") {
      body.addAll({
        'id_participate':res,
      });
      list_paricipate.insert(0,ParticipateModel.fromJson(body));
      isloading=false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_participate(Map<String, dynamic?> body,
      String id_participate ) async {
    //name_mange
    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'agent/update_participate.php?id_participate=${id_participate }',//users/addmangemt.php

        body: body);
    body.addAll({
      'id_participate':id_participate ,
    });

    final index=list_paricipate.indexWhere((element)
    => element.id_participate==id_participate );
    list_paricipate[index]=ParticipateModel.fromJson(body);
    isloading =false;
    notifyListeners();
    return res;
  }
}