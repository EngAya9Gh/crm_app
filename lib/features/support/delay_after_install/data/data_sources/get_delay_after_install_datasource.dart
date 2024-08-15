import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_delay_after_install_use_case.dart';

abstract class DelayAfterInstallDatasource {
  Future<PaginationResponseWrapper> getDelayAfterInstall(
    GetDelayAfterInstallParams params,
  );
}

@LazySingleton(as: DelayAfterInstallDatasource)
class DelayAfterInstallDatasourceImpl implements DelayAfterInstallDatasource {
  final ApiServices _api;

  const DelayAfterInstallDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getDelayAfterInstall(
      GetDelayAfterInstallParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getDelayAfterInstall,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getDelayAfterInstall in datasource => $e");
      throw e.message;
    }
  }
}
