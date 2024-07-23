import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/edit_advanced_configs_usecase.dart';
import '../../domain/use_cases/get_advanced_configs_usecase.dart';

abstract class AdvancedConfigsDatasource {
  Future<dynamic> getAdvancedConfigs(GetAdvancedConfigsParams params);

  Future<dynamic> editAdvancedConfigs(EditAdvancedConfigsParams params);
}

@LazySingleton(as: AdvancedConfigsDatasource)
class AdvancedConfigsDatasourceImpl implements AdvancedConfigsDatasource {
  final ApiServices _apiServices;

  AdvancedConfigsDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getAdvancedConfigs(GetAdvancedConfigsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.configs.getAdvancedConfigs,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getAdvancedConfigs: $e');
      throw e.message;
    }
  }

  @override
  Future editAdvancedConfigs(EditAdvancedConfigsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.configs.editAdvancedConfigs,
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in editAdvancedConfigs: $e');
      throw e.message;
    }
  }
}
