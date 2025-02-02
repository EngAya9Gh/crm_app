import 'package:flutter/cupertino.dart';

import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
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
  List<ManageModel> listMangTask = [];

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
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final data = await apiServices.get(
        endPoint: EndPoints.management.getManagement,
      );
      if (data['message'] != null) {
        for (int i = 0; i < data['message'].length; i++) {
          listtext.add(ManageModel.fromMap(data['message'][i]));
        }
      }
      isLoading = false;
    }
  }

  Future<void> getManagesTask() async {
    if (listMangTask.isEmpty) {
      isLoading = true;
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final data = await apiServices.get(
        endPoint: EndPoints.management.tasksManagement,
      );
      if (data['message'] != null) {
        for (int i = 0; i < data['message'].length; i++) {
          listMangTask.add(ManageModel.fromMap(data['message'][i]));
        }
      }
      isLoading = false;
    }
  }

  Future<String> addmanage_vm(Map<String, dynamic> body) async {
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var res = await  apiServices.post(
      endPoint: EndPoints.management.addManagement,
      data: body
    );
    if (res['result'] == "success") {
      body.addAll({
        'idmange': res['message']['idmange'],
      });
      //listoflevel=[];
      listtext.add(ManageModel.fromMap(body));
      notifyListeners();
    }
    return res['result'];
  }

  Future<String> update_manage(
      Map<String, dynamic> body, String idmanag) async {
    //name_mange
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var res =  await apiServices.post(
        endPoint: EndPoints.management.updateManagement(int.parse(idmanag)),
        data: body
    );
    body.addAll({
      'idmange': idmanag,
    });
    listtext=listtext.map((e) => e.idMange==idmanag?ManageModel.fromMap(body):e).toList();
    notifyListeners();

    return res['result'];
  }
}
