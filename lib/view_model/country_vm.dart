


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/countrymodel.dart';
import 'package:crm_smart/services/RegoinServices.dart';
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
  //
  Future<void> getcountry()async {
    listcountry=[];
    if (listcountry.isEmpty) {
      List<dynamic> data = [];
      listcountry= await RegoinService().getAllCountry();
      // data = await Api()
      //     .get(url: url +
      //     'country/get_regoinByIdCountry.php?fk_country=${usercurrent!
      //         .fkCountry}');
      // print(data);
      // if (data != null) {
      //   for (int i = 0; i < data.length; i++) {
      //     listregoin.add(RegoinModel.fromJson(data[i]));
      //   }
      // }
    }

    notifyListeners();
    //var  data=await RegoinService().getRegoinByCountry("1");
    //listregoin= data as  List<RegoinModel>;
  }
}