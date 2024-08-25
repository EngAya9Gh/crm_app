import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_periodic_communication_reports_usecase.dart';

abstract class PeriodicCommunicationReportsDatasource {
  Future<PaginationResponseWrapper> getPeriodicCommunicationReports(
    GetPeriodicCommunicationReportsParams params,
  );
}

@LazySingleton(as: PeriodicCommunicationReportsDatasource)
class PeriodicCommunicationReportsDatasourceImpl
    implements PeriodicCommunicationReportsDatasource {
  final ApiServices _api;

  const PeriodicCommunicationReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getPeriodicCommunicationReports(
    GetPeriodicCommunicationReportsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(
        endPoint: EndPoints.reports.getCareRateReports,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint(
          "error in getPeriodicCommunicationReports in datasource => $e");
      throw e.message;
    }
  }
}
