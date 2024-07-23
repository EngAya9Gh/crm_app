import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/edit_general_configs_usecase.dart';
import '../../domain/use_cases/get_general_configs_usecase.dart';

abstract class GeneralConfigsDatasource {
  Future<dynamic> getGeneralConfigs(GetGeneralConfigsParams params);

  Future<dynamic> editGeneralConfigs(EditGeneralConfigsParams params);
}

@LazySingleton(as: GeneralConfigsDatasource)
class GeneralConfigsDatasourceImpl implements GeneralConfigsDatasource {
  final ApiServices _apiServices;

  GeneralConfigsDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getGeneralConfigs(GetGeneralConfigsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.configs.getGeneralConfigs,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getGeneralConfigs: $e');
      throw e.message;
    }
  }

  @override
  Future editGeneralConfigs(EditGeneralConfigsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.configs.editGeneralConfigs,
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in editGeneralConfigs: $e');
      throw e.message;
    }
  }
}
