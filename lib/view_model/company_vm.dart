import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/companyModel.dart';

class CompanyProvider extends ChangeNotifier {
  List<CompanyModel> list_company = [];

  Future<void> getcompany({VoidCallback? onSuccess}) async {
    isloading = true;
    notifyListeners();

    try {
      var response = await getIt<ApiServices>().get(endPoint: EndPoints.baseUrls.url + 'config/get_company.php');
      var res = jsonDecode(response);
      var data = res['message'];
      List<CompanyModel> prodlist = [];
      for (int i = 0; i < data.length; i++) {
        prodlist.add(CompanyModel.fromJson(data[i]));
      }
      list_company = prodlist;

      isloading = false;
      onSuccess?.call();

      notifyListeners();
    } on Exception catch (e) {
      isloading = false;
      notifyListeners();
      print(e);
      throw e;
    }
  }

  String? selectedValueOut;

  initValueOut() => selectedValueOut != null;

  void changevalueOut(String? s) {
    selectedValueOut = s;
    notifyListeners();
  }

  bool isloading = false;

  Future<String> addCompany_vm(
    Map<String, dynamic> body,
    XFile? file,
  ) async {
    isloading = true;
    notifyListeners();

    final _apiServices = getIt<ApiServices>();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.company.addCompany,
      data: body,
      fileLogo: file,
    );

    final data = apiDataHandler(response);

    list_company.insert(0, CompanyModel.fromJson(data));

    isloading = false;
    notifyListeners();

    return data['id_Company'].toString();
  }

  Future<String> update_company(
    Map<String, dynamic> body,
    String idcompany,
    XFile? file,
  ) async {
    isloading = true;
    notifyListeners();
    final _apiServices = getIt<ApiServices>();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.company.updateCompany(idcompany),
      data: body,
      fileLogo: file,
    );

    final data = apiDataHandler(response);

    final index = list_company.indexWhere((element) => element.id_Company == idcompany);
    list_company[index] = CompanyModel.fromJson(data);
    isloading = false;
    notifyListeners();

    return data['id_Company'].toString();
  }
}
