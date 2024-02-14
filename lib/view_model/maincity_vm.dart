import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../constants.dart';

class MainCityProvider extends ChangeNotifier {
  List<MainCityModel> listmaincity = [];
  List<MainCityModel> listmaincityfilter = [];
  List<MainCityModel> listCurrentUserMainCityFilter = [];
  List<CityModel> listcity = [];
  List<CityModel> filteredCitiesList = [];
  List<CityModel> selectedCities = [];

  late String? selectedValuemanag = null;

  void changevalue(String? s) {
    selectedValuemanag = s;
    notifyListeners();
  }

  late List<MainCityModel> selecteditemmaincity = [];

  Future<void> changeitemlist(List<MainCityModel> s, {bool isInit = false}) async {
    selecteditemmaincity = s;
    isloading = true;
    if (!isInit) notifyListeners();
    await getCitiesFromRegions();
    isloading = false;
    if (!isInit) notifyListeners();
  }

  filterMainCityByCurrentUserMainCityList(UserModel user) {
    final list = List.of(listmaincity);
    final listMainCityUser = user.maincitylist_user?.map((e) => e.fk_maincity!).toList() ?? [];

    listCurrentUserMainCityFilter = list.where((element) => listMainCityUser.contains(element.id_maincity)).toList();
    selecteditemmaincity = listCurrentUserMainCityFilter;
  }

  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  bool isloading = false;

  Future<void> getmaincity({List<UserRegion>? regions}) async {
    listmaincity = [];
    notifyListeners();
    if (listmaincity.isEmpty) {
      List<dynamic> data = [];
      data = await Api().get(url: url + 'config/getmaincity.php?fk_country=${usercurrent!.fkCountry}');
      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listmaincity.add(MainCityModel.fromJson(data[i]));
        }
      }
      listmaincityfilter = List.from(listmaincity); // [...listregoin];listregoin.tolist();
      listmaincityfilter.insert(0, MainCityModel(id_maincity: '0', namemaincity: 'الكل', fk_country: ''));
      listCurrentUserMainCityFilter = List.from(listmaincity);

      selectedValuemanag = '1';
      notifyListeners();
    }

    if (regions != null) {
      selecteditemmaincity = regions.map((e) => e.asMainCity).toList();
      notifyListeners();
    }
  }

  Future<String> addmaincity_vm(Map<String, dynamic?> body) async {
    //name_mange
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: url + 'config/addmaincity.php', //users/addmangemt.php
        body: body);
    if (res != "error") {
      body.addAll({
        'id_maincity': res,
      });
      //listoflevel=[];
      listmaincity.add(MainCityModel.fromJson(body));
      listCurrentUserMainCityFilter.add(MainCityModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_maincity(Map<String, dynamic?> body, String id_maincity) async {
    //name_mange
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: url + 'config/update_maincity.php?id_maincity=${id_maincity}', //users/addmangemt.php
        body: body);
    body.addAll({
      'id_maincity': id_maincity,
    });
    final index = listmaincity.indexWhere((element) => element.id_maincity == id_maincity);
    final indexListCurrentUser =
        listCurrentUserMainCityFilter.indexWhere((element) => element.id_maincity == id_maincity);
    listmaincity[index] = MainCityModel.fromJson(body);

    if (indexListCurrentUser != -1) listCurrentUserMainCityFilter[indexListCurrentUser] = MainCityModel.fromJson(body);
    isloading = false;
    notifyListeners();

    return res;
  }

//////////////////////////////////////////
  Future<String> addcity_vm(Map<String, dynamic?> body) async {
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: url + 'config/addcity.php', //users/addmangemt.php
        body: body);
    if (res != "error") {
      body.addAll({
        'id_city': res,
      });
      listcity.add(CityModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_city(Map<String, dynamic?> body, String id_city) async {
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: url + 'config/updatecity.php?id_city=${id_city}', //users/addmangemt.php
        body: body);
    final index = listcity.indexWhere((element) => element.id_city == id_city);
    listcity[index] = CityModel.fromJson(body);
    isloading = false;
    notifyListeners();

    return res;
  }

  Future<void> getcity(String fkmain) async {
    listcity = [];
    if (listcity.isEmpty) {
      List<dynamic> data = [];
      data = await Api().get(url: url + 'config/getcity.php?fk_maincity=${fkmain}');
      
      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listcity.add(CityModel.fromJson(data[i]));
        }
      }
      // selectedValuemanag='1';
      notifyListeners();
      //return data;
    }
  }

  Future<void> getcityAll({VoidCallback? onSuccess}) async {
    listcity = [];
    notifyListeners();
    if (listcity.isEmpty) {
      List<dynamic> data = [];
      data = await Api().get(url: url + 'config/getcity.php?fk_country=${usercurrent!.fkCountry}');

      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listcity.add(CityModel.fromJson(data[i]));
        }
      }

      onSuccess?.call();
      notifyListeners();
    }
  }

  Future<void> getCitiesFromRegions() async {
    final List<String> regionsIds = _getAllRegionsIds();
    final Response response = await _fetchCitiesFromApi(regionsIds);
    filteredCitiesList = _filterCities(response.data["data"]);
    selectedCities = filteredCitiesList;
    print("length => ${filteredCitiesList.length}");
    notifyListeners();
  }

  List<String> _getAllRegionsIds() {
    return selecteditemmaincity.map((e) => e.id_maincity).toList();
  }

  Future<Response<dynamic>> _fetchCitiesFromApi(
      List<String> mainCitiesIds) async {
    return await GetIt.I<Dio>().post(
      'http://test.smartcrm.ws/api/getCitiesFromMainCitiesIds',
      // todo: cooperate with backend to remove cities magic numbers
      data: {'mainCitiesIds': mainCitiesIds.toString()}, // 1 is the "All" city
    );
  }

  List<CityModel> _filterCities(List<dynamic> citiesData) {
    return List<CityModel>.from(citiesData.map((cityData) {
      return CityModel.fromJson(cityData);
    }));
  }
}
