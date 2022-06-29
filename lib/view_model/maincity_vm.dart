

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class maincity_vm extends ChangeNotifier{
  List<MainCityModel> listmaincity=[];
  List<MainCityModel> listmaincityfilter=[];
  List<CityModel> listcity=[];

  late String? selectedValuemanag=null;
  void changevalue(String? s){
    selectedValuemanag=s;
    notifyListeners();
  }
  late List<MainCityModel> selecteditemmaincity=[];
  void changeitemlist(List<MainCityModel> s){
    selecteditemmaincity=s;
    notifyListeners();
  }

  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  bool isloading=false;
  Future<void> getmaincity()async {
    listmaincity=[];
    notifyListeners();
    if(listmaincity.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+ 'config/getmaincity.php?fk_country=${usercurrent!.fkCountry}');
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listmaincity.add(MainCityModel.fromJson(data[i]));
        }
      }
      listmaincityfilter=List.from(listmaincity);// [...listregoin];listregoin.tolist();
      listmaincityfilter.insert(0,MainCityModel(
          id_maincity: '0', namemaincity: 'الكل', fk_country: ''));
      selectedValuemanag='1';
      notifyListeners();
    }
  }
  Future<String> addmaincity_vm(Map<String, dynamic?> body) async {
    //name_mange
    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'config/addmaincity.php',//users/addmangemt.php
        body: body);
    if (res!="error") {
      body.addAll({
        'id_maincity':res,
      });
      //listoflevel=[];
      listmaincity.add(MainCityModel.fromJson(body));
      isloading=false;
      notifyListeners();
    }
    return res;
  }
  Future<String> update_maincity
      (Map<String, dynamic?> body,String id_maincity) async {
    //name_mange
    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'config/update_maincity.php?id_maincity=${id_maincity}',//users/addmangemt.php
        body: body);
    body.addAll({
      'id_maincity':id_maincity,
    });
    final index=listmaincity.indexWhere((element)
    => element.id_maincity==id_maincity);
    listmaincity[index]=MainCityModel.fromJson(body);

    isloading=false;
    notifyListeners();

    return res;
  }
//////////////////////////////////////////
  Future<String> addcity_vm(Map<String, dynamic?> body) async {

    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'config/addcity.php',//users/addmangemt.php
        body: body);
    if (res!="error") {
      body.addAll({
        'id_city':res,
      });
      listcity.add(CityModel.fromJson(body));
      isloading=false;
      notifyListeners();
    }
    return res;
  }
  Future<String> update_city(Map<String, dynamic?> body,String id_city)
  async {
    isloading=true;
    notifyListeners();
    String res = await Api().post(
        url: url+'config/updatecity.php?id_city=${id_city}',//users/addmangemt.php
        body: body);
    final index=listcity.indexWhere((element)
    => element.id_city==id_city);
    listcity[index]=CityModel.fromJson(body);
    isloading=false;
    notifyListeners();

    return res;
  }
  Future<void> getcity(String fkmain)async {
    listcity=[];
    if(listcity.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+ 'config/getcity.php?fk_maincity=${fkmain}');
      print(data);
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listcity.add(CityModel.fromJson(data[i]));
        }
      }
      // selectedValuemanag='1';
      notifyListeners();
      //return data;
    }
  }
  Future<void> getcityAll()async {

    listcity=[];
    notifyListeners();
    if(listcity.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+
          'config/getcity.php?fk_country=${usercurrent!.fkCountry}');
      print(data);
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listcity.add(CityModel.fromJson(data[i]));
        }}

      notifyListeners();

    }
  }
}