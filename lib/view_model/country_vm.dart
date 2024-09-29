import 'package:flutter/cupertino.dart';

import '../model/countrymodel.dart';
import '../services/RegoinServices.dart';

class country_vm extends ChangeNotifier {
  bool isGetCountryLoading = false;
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
    if (listcountry.isEmpty) {
      isGetCountryLoading = true;
      listcountry = await RegoinService().getAllCountry();
      isGetCountryLoading = false;
    }

    notifyListeners();
  }
}
