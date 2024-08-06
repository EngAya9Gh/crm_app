import 'package:crm_smart/core/common/enums/install_quality_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_install_use_case.dart';

abstract class InstallQualityDatasource {
  Future<PaginationResponseWrapper> getInstall(
    GetInstallParams params,
  );
}

@LazySingleton(as: InstallQualityDatasource)
class InstallQualityDatasourceImpl implements InstallQualityDatasource {
  final ApiServices _api;

  const InstallQualityDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getInstall(
    GetInstallParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(
        endPoint: params.installQualityType.url,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getInstall in datasource => $e");
      throw e.message;
    }
  }
}
