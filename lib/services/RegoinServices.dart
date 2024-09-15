//country/get_regoinByIdCountry.php
//country/getcountryByID.php

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/countrymodel.dart';

import '../core/utils/end_points.dart';

class RegoinService {
  Future<List<CountryModel>> getAllCountry() async {
    List<dynamic> data = [];
    try {
      data = await Api()
          .get(url: EndPoints.baseUrls.url + 'country/getcountry.php');

      List<CountryModel> list = [];

      for (int i = 0; i < data.length; i++) {
        list.add(CountryModel.fromJson(data[i]));
      }

      return list;
    } catch (e) {
      return data as List<CountryModel>;
    }
  }
}
