import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/common/models/location/branch_model.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/usermodel.dart';

class RegionProvider extends ChangeNotifier {
  List<BranchModel> listRegion = [];
  List<BranchModel> listRegionFilter = [];
  String? selectedRegionId;

  void changeVal(String? val) {
    if (val == null || val == "null") {
      selectedRegionId = null;
    } else {
      selectedRegionId = val;
    }
    notifyListeners();
  }

  late String? selectedValueuser = null;

  void changeValuser(String? val, [bool isInit = false]) {
    if (val == null || val == "null") {
      selectedValueuser = null;
    } else {
      selectedValueuser = val;
    }

    if (!isInit) notifyListeners();
  }

  UserModel? userCurrent;

  void setCurrentUser(UserModel user) {
    userCurrent = user;
    notifyListeners();
  }

  Future<void> getRegions() async {
    try {
      listRegionFilter = [];
      if (listRegion.isEmpty) {
        var data;
        final ApiServices apiServices = getIt<ApiServices>();
        apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
        data = await apiServices.get(endPoint: EndPoints.branches.getBranches, queryParameters: {
          'fk_country': userCurrent!.fkCountry,
        });
        // data = await Api().get(url: EndPoints.baseUrls.url + 'country/get_regoinByIdCountry.php?fk_country=${userCurrent!.fkCountry}');
        if (data['message'] != null) {
          for (int i = 0; i < data['message'].length; i++) {
            listRegion.add(BranchModel.fromJson(data['message'][i]));
          }
        }
      }
      listRegionFilter = List.from(listRegion); // [...listregoin];listregoin.tolist();
      listRegionFilter.insert(0, BranchModel(branchId: '0', branchName: 'الكل', countryId: ''));
      notifyListeners();
      //var  data=await RegoinService().getRegoinByCountry("1");
      //listregoin= data as  List<RegoinModel>;}
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint('Error in getRegions in RegionProvider: $e');
    }
  }

  bool isLoading = false;

  Future<String> addRegionVm(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    var res = await apiServices.post(endPoint: EndPoints.branches.addBranches, data: body);
    if (res['result'] == "success") {
      listRegion.insert(
          0,
        BranchModel.convertRegionToBranch(res['message'] as Map<String, dynamic>)
          );
      isLoading = false;
      notifyListeners();
    }
    return res['result'];
  }

  Future<String> updateRegion(Map<String, dynamic> body, String idmanag) async {
    isLoading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    var res = await apiServices.post(endPoint: EndPoints.branches.updateBranches(idmanag), data: body);

    final index = listRegion.indexWhere((element) => element.branchId == idmanag);
    listRegion[index] = BranchModel.convertRegionToBranch(res['message'] as Map<String, dynamic>);
    // listregoin.add(RegoinModel.fromJson(body));
    isLoading = false;
    notifyListeners();

    return res['result'];
  }
}
