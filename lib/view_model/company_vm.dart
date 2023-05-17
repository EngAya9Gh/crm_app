

import 'dart:io';

import 'package:crm_smart/model/companyModel.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../services/configService.dart';

class company_vm extends ChangeNotifier {
  List<CompanyModel> list_company=[];

  Future<void> getcompany( ) async {

    // notifyListeners();
    //  if(list_activity.isEmpty)
    list_company = await await Api().get(url: url+'');
    notifyListeners();
  }

  late String? selectedValueOut=null;
  void changevalueOut(String s){
    selectedValueOut=s;
    notifyListeners();
  }

  bool isloading=false;
  Future<String> addCompany_vm(Map<String, dynamic?> body,File? file) async {
    isloading =true;
    notifyListeners();
    String res = await Api().postRequestWithFile(
          "array",
          url+'config/addactv.php',//users/addmangemt.php
          body,file,null);
    if (res!="error") {
      body.addAll({
        'id_activity_type':res,
      });
      list_company.insert(0,CompanyModel.fromJson(body));
      isloading=false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_company(Map<String,dynamic> body,
      String idcompany,File? file  ) async {
    //name_mange
    isloading=true;
    notifyListeners();
    String res = await Api().postRequestWithFile(
        "array",
         url+'config/update_actv.php?id_activity_type=${idcompany }',//users/addmangemt.php
         body,file,null
    );
    body.addAll({
      'id_company':idcompany ,
    });
    final index=list_company.indexWhere((element)
    => element.id_Company==idcompany );
    list_company[index]=CompanyModel.fromJson(body);
    isloading =false;
    notifyListeners();

    return res;
  }
}