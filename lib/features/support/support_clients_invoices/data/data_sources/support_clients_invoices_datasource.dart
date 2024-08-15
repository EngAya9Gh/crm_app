import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_support_clients_invoices_use_case.dart';

abstract class SupportClientsInvoicesDatasource {
  Future<PaginationResponseWrapper> getSupportClientInvoices(
    GetSupportClientsInvoicesParams params,
  );
}

@LazySingleton(as: SupportClientsInvoicesDatasource)
class DelayInstallReportsDatasourceImpl
    implements SupportClientsInvoicesDatasource {
  final ApiServices _api;

  const DelayInstallReportsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getSupportClientInvoices(
    GetSupportClientsInvoicesParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.invoice.getInvoiceMainCity,
        queryParameters: params.toParams(),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getSupportClientInvoices in datasource => $e");
      throw e.message;
    }
  }
}
