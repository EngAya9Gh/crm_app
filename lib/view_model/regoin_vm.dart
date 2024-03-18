import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../core/utils/end_points.dart';

class RegionProvider extends ChangeNotifier {
  List<RegionModel> listRegion = [];
  List<RegionModel> listRegionFilter = [];
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

  void clearvalues() {
    listRegion = [];
    selectedRegionId = null;
    notifyListeners();
  }

  UserModel? userCurrent;

  void setCurrentUser(UserModel user) {
    userCurrent = user;
    notifyListeners();
  }

  Future<void> getRegions() async {
    listRegionFilter = [];
    if (listRegion.isEmpty) {
      List<dynamic> data = [];
      data = await Api().get(
          url: EndPoints.baseUrls.url +
              'country/get_regoinByIdCountry.php?fk_country=${userCurrent!.fkCountry}');
      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listRegion.add(RegionModel.fromJson(data[i]));
        }
      }
    }
    listRegionFilter =
        List.from(listRegion); // [...listregoin];listregoin.tolist();
    listRegionFilter.insert(
        0, RegionModel(regionId: '0', regionName: 'الكل', countryId: ''));
    notifyListeners();
    //var  data=await RegoinService().getRegoinByCountry("1");
    //listregoin= data as  List<RegoinModel>;
  }

  bool isLoading = false;

  Future<String> addRegionVm(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'users/add_regoin.php', //users/addmangemt.php
        body: body);
    if (res != "error") {
      body.addAll({
        'id_regoin': res,
      });
      listRegion.insert(0, RegionModel.fromJson(body));
      isLoading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> updateRegion(Map<String, dynamic> body, String idmanag) async {
    isLoading = true;
    notifyListeners();
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'users/update_regoin.php?id_regoin=${idmanag}',
        //users/addmangemt.php
        body: body);

    final index =
        listRegion.indexWhere((element) => element.regionId == idmanag);
    listRegion[index] = RegionModel.fromJson(body);
    // listregoin.add(RegoinModel.fromJson(body));
    isLoading = false;
    notifyListeners();

    return res;
  }
}
