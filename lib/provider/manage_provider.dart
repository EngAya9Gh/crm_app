import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/utils/end_points.dart';
import '../model/managmodel.dart';

class manage_provider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<ManageModel> listtext = [];

  // 'مشرف مبيعات',
  // 'موظف مبيعات',
  // 'إدارة عناية بالعملاء',
  // 'موظف دعم',
  // 'مدير دعم',
  // 'إدارة عليا',
  // 'الإدارة المالية',
  // 'ادارة التحصيل',
  // 'إدارة العمليات'];

  late String? selectedValuemanag = null;

  void changevalue(String? s) {
    selectedValuemanag = s;
    notifyListeners();
  }

  Future<void> getManages() async {
    if (listtext.isEmpty) {
      isLoading = true;
      List<dynamic>? data = await Api()
          .get(url: EndPoints.baseUrls.url + 'users/getmanagment.php');

      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listtext.add(ManageModel.fromJson(data[i]));
        }
      }
      isLoading = false;
    }
  }

  Future<String> addmanage_vm(Map<String, dynamic?> body) async {
    //name_mange
    String res = await Api().post(
        url: EndPoints.baseUrls.url + 'users/addmangemt.php',
        //users/addmangemt.php
        body: body);
    if (res != "error") {
      body.addAll({
        'idmange': res,
      });
      //listoflevel=[];
      listtext.add(ManageModel.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<String> update_manage(
      Map<String, dynamic?> body, String idmanag) async {
    //name_mange
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'users/update_manage.php?idmange=${idmanag}',
        //users/addmangemt.php
        body: body);
    body.addAll({
      'idmange': idmanag,
    });
    listtext.add(ManageModel.fromJson(body));
    notifyListeners();

    return res;
  }
}
