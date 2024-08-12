import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_status_reports_usecase.dart';

abstract class ClientsStatusReportsDatasource {
  Future<PaginationResponseWrapper> getClientsStatusReports(
    GetClientsStatusReportsParams params,
  );
}

@LazySingleton(as: ClientsStatusReportsDatasource)
class ClientsStatusReportsDatasourceImpl
    implements ClientsStatusReportsDatasource {
  final ApiServices _api;

  const ClientsStatusReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsStatusReports(
      GetClientsStatusReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getClientsStatusReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsStatusReports in datasource => $e");
      throw e.message;
    }
  }
}
