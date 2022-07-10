


import 'package:crm_smart/model/countrymodel.dart';
import 'package:flutter/cupertino.dart';

class country_vm extends ChangeNotifier{
  late String id_country,id_regoin;
  late String currency;
  bool isloading=false;

  List<CountryModel> listcountry=[];

  country_vm(){}

  late String? selectedValueuser=null;
  void changeValuser(String?  val){

    print(val);
    if(val==null||val=="null")
    {
      selectedValueuser=null;
    }
    else
    {selectedValueuser=val;print('regoin in vm');}
    notifyListeners();
  }
  setIDCountry(val){
    this.id_country=val;
    notifyListeners();
  }
  setIDRegoin(val){
    this.id_regoin=val;
    notifyListeners();
  }
}