


//country/get_regoinByIdCountry.php
//country/getcountryByID.php

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/Error_model.dart';
import 'package:crm_smart/model/countrymodel.dart';
import 'package:crm_smart/model/regoin_model.dart';

import '../constants.dart';

class RegoinService{

  Future<Object> getRegoinByCountry(String fk_country) async {

    
    List<RegionModel> _Regoinlist=[];

    try{
      List<dynamic> data= await Api()
        .get(url:url+ 'country/get_regoinByIdCountry.php?fk_country=$fk_country');

    for (int i = 0; i < data.length; i++) {
      _Regoinlist.add(RegionModel.fromJson(data[i]));
    }}
    catch(e){
      return ErrorModel(message: e);
    }
    return _Regoinlist;
  }
  Future<List<CountryModel>> getAllCountry() async {
    List<dynamic> data=[];
    try{
     data= await Api()
        .get(url:url+ 'country/getcountry.php'
     );

    List<CountryModel> list = [];
    
    for (int i = 0; i < data.length; i++) {
      list.add(CountryModel.fromJson(data[i]));
    }

    return list;
    }
        catch(e){
      
      return data as List<CountryModel>;
        }
  }

}