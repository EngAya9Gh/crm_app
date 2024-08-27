import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_regions_use_case.dart';

abstract class RegionsDatasource {
  Future<PaginationResponseWrapper> getRegions(GetRegionsParams params);
}

@LazySingleton(as: RegionsDatasource)
class RegionsDatasourceImpl implements RegionsDatasource {
  final ApiServices _apiServices;

  RegionsDatasourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getRegions(GetRegionsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.city.getRegions(params.fkCountry),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getRegions in datasource: ${e.message}");
      throw e.message;
    }
  }
}
