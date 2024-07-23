import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_regions_by_id_country_usecase.dart';

abstract class RegionsDatasource {
  Future<dynamic> getRegionsByIdCountry(
    GetRegionsByIdCountryParams params,
  );
}

@LazySingleton(as: RegionsDatasource)
class RegionsDatasourceImpl implements RegionsDatasource {
  final ApiServices _apiServices;

  RegionsDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getRegionsByIdCountry(
    GetRegionsByIdCountryParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _apiServices.get(
        endPoint: EndPoints.city.getRegionsByIdCountry,
        queryParameters: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getRegionsByIdCountry: $e');
      throw e.message;
    }
  }
}
