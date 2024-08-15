import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_install_reports_usecase.dart';

abstract class ClientsInstallReportsDatasource {
  Future<PaginationResponseWrapper> getClientsInstallReports(
    GetClientsInstallReportsParams params,
  );
}

@LazySingleton(as: ClientsInstallReportsDatasource)
class ClientsInstallReportsDatasourceImpl
    implements ClientsInstallReportsDatasource {
  final ApiServices _api;

  const ClientsInstallReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsInstallReports(
      GetClientsInstallReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getClientsInstallReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsInstallReports in datasource => $e");
      throw e.message;
    }
  }
}
