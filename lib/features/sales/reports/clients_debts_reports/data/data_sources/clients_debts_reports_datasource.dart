import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_debts_reports_usecase.dart';

abstract class ClientsDebtsReportsDatasource {
  Future<PaginationResponseWrapper> getClientsDebtsReports(
    GetClientsDebtsReportsParams params,
  );
}

@LazySingleton(as: ClientsDebtsReportsDatasource)
class ClientsDebtsReportsDatasourceImpl
    implements ClientsDebtsReportsDatasource {
  final ApiServices _api;

  const ClientsDebtsReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsDebtsReports(
      GetClientsDebtsReportsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.post(
        endPoint: EndPoints.reports.getClientsDebtsReports,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsDebtsReports in datasource => $e");
      throw e.message;
    }
  }
}
