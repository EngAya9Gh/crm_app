import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_finance_pending_invoices_usecase.dart';

abstract class FinancePendingDatasource {
  Future<PaginationResponseWrapper> getFinancePendingInvoices(
    GetFinancePendingInvoicesParams params,
  );
}

@LazySingleton(as: FinancePendingDatasource)
class FinancePendingDatasourceImpl implements FinancePendingDatasource {
  final ApiServices _api;

  const FinancePendingDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getFinancePendingInvoices(
      GetFinancePendingInvoicesParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.invoice.getPendingApproveFinance,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getFinancePendingInvoices in datasource => $e");
      throw e.message;
    }
  }
}
