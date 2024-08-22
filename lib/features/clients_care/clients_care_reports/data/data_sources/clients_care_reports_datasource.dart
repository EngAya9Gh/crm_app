import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_care_reports_usecase.dart';

abstract class ClientsCareReportsDatasource {
  Future<PaginationResponseWrapper> getClientsCareReports(
    GetClientsCareReportsParams params,
  );
}

@LazySingleton(as: ClientsCareReportsDatasource)
class ClientsCareReportsDatasourceImpl implements ClientsCareReportsDatasource {
  final ApiServices _api;

  const ClientsCareReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsCareReports(
    GetClientsCareReportsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getClientsCareReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsCareReports in datasource => $e");
      throw e.message;
    }
  }
}
