import 'package:flutter/cupertino.dart';

import '../model/countrymodel.dart';
import '../services/RegoinServices.dart';

class country_vm extends ChangeNotifier {
  late String id_country, id_regoin;

  List<CountryModel> listcountry = [];

  country_vm() {}

  late String? selectedValueuser = null;

  void changeValuser(String? val) {
    if (val == null || val == "null") {
      selectedValueuser = null;
    } else {
      selectedValueuser = val;
      notifyListeners();
    }
  }

  //
  Future<void> getcountry() async {
    listcountry = [];
    if (listcountry.isEmpty) {
      List<dynamic> data = [];
      listcountry = await RegoinService().getAllCountry();
    }

    notifyListeners();
  }
}
