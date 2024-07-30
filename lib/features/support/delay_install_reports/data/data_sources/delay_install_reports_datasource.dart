import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_delay_install_reports_use_case.dart';

abstract class DelayInstallReportsDatasource {
  Future<PaginationResponseWrapper> getDelayInstallReports(
    GetDelayInstallReportsParams params,
  );
}

@LazySingleton(as: DelayInstallReportsDatasource)
class DelayInstallReportsDatasourceImpl
    implements DelayInstallReportsDatasource {
  final ApiServices _api;

  const DelayInstallReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getDelayInstallReports(
      GetDelayInstallReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getDelayInstallReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper(
        data: apiDataHandler(response),
        count: response['count'],
      );
    } on BaseAppException catch (e) {
      debugPrint("error in getDelayInstallReports => $e");
      throw e.message;
    }
  }
}
