


import 'package:flutter/cupertino.dart';

class country_vm extends ChangeNotifier{
  late String id_country,id_regoin;
  late String currency;
  country_vm(){

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