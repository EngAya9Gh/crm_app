import 'dart:io';

import 'package:crm_smart/model/companyModel.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../services/configService.dart';

class company_vm extends ChangeNotifier {
  List<CompanyModel> list_company = [];

  Future<void> getcompany() async {
    // notifyListeners();
    //  if(list_activity.isEmpty)
    var data = await Api().get(url: url + 'config/get_company.php');

    List<CompanyModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      
      prodlist.add(CompanyModel.fromJson(data[i]));
    }
    list_company = prodlist.toList();
    // list_company.insert(0, null);

    notifyListeners();
  }

  late String? selectedValueOut = null;

  initValueOut() => selectedValueOut = null;

  void changevalueOut(String? s) {
    if (s?.isEmpty ?? true) {
      return;
    }
    selectedValueOut = s;
    notifyListeners();
  }

  bool isloading = false;

  Future<String> addCompany_vm(Map<String, dynamic?> body, File? file) async {
    isloading = true;
    notifyListeners();
    String res = await Api().postRequestWithFile(
        "array",
        url + 'config/add_company.php', //users/addmangemt.php
        body,
        file,
        null);
    if (res != "error") {
      body.addAll({
        'id_Company': res,
      });
      list_company.insert(0, CompanyModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_company(Map<String, dynamic> body, String idcompany, File? file) async {
    //name_mange
    isloading = true;
    notifyListeners();
    String res = await Api().postRequestWithFile(
        "array",
        url + 'config/update_company.php?id_Company=${idcompany}', //users/addmangemt.php
        body,
        file,
        null);
    body.addAll({
      'id_Company': idcompany,
    });
    final index = list_company.indexWhere((element) => element.id_Company == idcompany);
    list_company[index] = CompanyModel.fromJson(body);
    isloading = false;
    notifyListeners();

    return res;
  }
}
