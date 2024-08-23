import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_branches_by_id_country_use_case.dart';

abstract class BranchesDatasource {
  Future<dynamic> getBranchesByIdCountry(
    GetBranchesByIdCountryParams params,
  );
}

@LazySingleton(as: BranchesDatasource)
class BranchesDatasourceImpl implements BranchesDatasource {
  final ApiServices _apiServices;

  BranchesDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getBranchesByIdCountry(
    GetBranchesByIdCountryParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.city.getBranches,
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getBranchesByIdCountry: $e');
      throw e.message;
    }
  }
}
