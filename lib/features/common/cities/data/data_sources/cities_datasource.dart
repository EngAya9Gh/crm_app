import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_cities_usecase.dart';

abstract class CitiesDatasource {
  Future<PaginationResponseWrapper> getCities(GetCitiesParams params);
}

@LazySingleton(as: CitiesDatasource)
class CitiesDatasourceImpl implements CitiesDatasource {
  final ApiServices _apiServices;

  CitiesDatasourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getCities(GetCitiesParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.city.getAllCities,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getCities: ${e.message}");
      throw e.message;
    }
  }
}
