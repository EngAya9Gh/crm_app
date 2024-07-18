import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_cities_usecase.dart';

abstract class CitiesDatasource {
  Future<dynamic> getCities(GetCitiesParams params);
}

@LazySingleton(as: CitiesDatasource)
class CitiesDatasourceImpl implements CitiesDatasource {
  final ApiServices _apiServices;

  CitiesDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getCities(GetCitiesParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _apiServices.get(
        endPoint: "${EndPoints.city.getAllCities}${params.fkCountry}",
      );

      return response["message"];
    } on BaseAppException catch (e) {
      debugPrint("error in getAllCities: ${e.message}");
      throw e.message;
    }
  }
}
