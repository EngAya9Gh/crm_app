import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/common/models/location/city_model.dart';
import '../core/common/models/location/region_model.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/usermodel.dart';

class MainCityProvider extends ChangeNotifier {
  List<RegionModel> listmaincity = [];
  List<RegionModel> listmaincityfilter = [];
  List<CityModel> listcity = [];
  List<CityModel> filteredCitiesList = [];
  List<CityModel> selectedCities = [];

  late String? selectedValuemanag = null;

  void changevalue(String? s) {
    selectedValuemanag = s;
    notifyListeners();
  }

  late List<RegionModel> selectedRegions = [];

  Future<void> changeItemsList(
    List<RegionModel> s, {
    bool isInit = false,
  }) async {
    selectedRegions = s;
    isloading = true;
    if (!isInit) notifyListeners();
    await getCitiesFromRegions();
    isloading = false;
    if (!isInit) notifyListeners();
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
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      //name_mange
      var res = await  apiServices.get(
        endPoint: EndPoints.regionAndCity.getRegion(usercurrent!.fkCountry!),
      );
      data = res['message'];
      if (res['message'] != null) {
        for (int i = 0; i < data.length; i++) {
          listmaincity.add(RegionModel.fromJson(data[i]));
        }
      }
      listmaincityfilter = List.from(listmaincity); // [...listregoin];listregoin.tolist();

      selectedValuemanag = '1';
      notifyListeners();
    }

    if (regions != null) {
      selectedRegions = regions.map((e) => e.asRegion).toList();
      notifyListeners();
    }
  }

  Future<String> addmaincity_vm(Map<String, dynamic> body) async {
    //name_mange
    isloading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var res =  await apiServices.post(endPoint: EndPoints.regionAndCity.addRegion(usercurrent!.fkCountry!), data: body);
    if (res['result'] == "success") {
      body.addAll({
        'id_maincity': res['message']['id_maincity'],
      });
      //listoflevel=[];
      listmaincity.add(RegionModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return res['result'];
  }

  Future<String> update_maincity(Map<String, dynamic> body, String id_maincity) async {
    //name_mange
    isloading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    var res =  await apiServices.post(endPoint: EndPoints.regionAndCity.updateRegion(usercurrent!.fkCountry!), data: body);
    body.addAll({
      'id_maincity': id_maincity,
    });
    final index = listmaincity.indexWhere((element) => element.id_maincity == id_maincity);

    listmaincity[index] = RegionModel.fromJson(body);

    isloading = false;
    notifyListeners();

    return res['result'];
  }

//////////////////////////////////////////
  Future<String> addcity_vm(Map<String, dynamic> body) async {
    isloading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    final response = await apiServices.post(endPoint: EndPoints.regionAndCity.addCities, data: body);

    if (response['result'] == "success") {
      body.addAll({
        'id_city': response['message']['id_city'],
      });
      listcity.add(CityModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return response['result'];
  }

  Future<String> update_city(Map<String, dynamic> body, String id_city) async {
    isloading = true;
    notifyListeners();
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    //name_mange
    final response =  await apiServices.post(endPoint: EndPoints.regionAndCity.updateCities(id_city), data: body);
    final index = listcity.indexWhere((element) => element.cityId == id_city);
    listcity[index] = CityModel.fromJson(body);
    isloading = false;
    notifyListeners();

    return response['result'];
  }

  Future<void> getcity(RegionModel regionModel) async {
    listcity = [];
    if (listcity.isEmpty) {
      List<dynamic> data = [];
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      //name_mange
      final response = await apiServices.get(
        endPoint: EndPoints.regionAndCity.getCities,
        queryParameters: {
          'fk_country':regionModel.fk_country,
          'fk_maincity':regionModel.id_maincity,
        },
      );
      data = response['message'];
      if (data.isNotEmpty) {
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
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      //name_mange
      final response = await apiServices.get(
        endPoint: EndPoints.regionAndCity.getCitiesAll,
      );
      data = response['message'];

      // data = await Api().get(url: EndPoints.baseUrls.url + 'config/getcity.php?fk_country=${usercurrent!.fkCountry}');

      if (data.isNotEmpty) {
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
    final response = await _fetchCitiesFromApi(regionsIds);
    filteredCitiesList = _filterCities(response["data"]);
    selectedCities = List.from(filteredCitiesList);
    notifyListeners();
  }

  List<String> _getAllRegionsIds() {
    return selectedRegions.map((e) => e.id_maincity).toList();
  }

  Future _fetchCitiesFromApi(List<String> mainCitiesIds) async {
    getIt<ApiServices>().changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response =
        await getIt<ApiServices>().post(endPoint: EndPoints.city.getCitiesFromMainCitiesIds, data: {'mainCitiesIds': mainCitiesIds.toString()});
    getIt<ApiServices>().changeBaseUrl(EndPoints.baseUrls.url);

    return response;
  }

  List<CityModel> _filterCities(List<dynamic> citiesData) {
    return List<CityModel>.from(citiesData.map((cityData) {
      return CityModel.fromJson(cityData);
    }));
  }
}
