import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_manage_withdrawn_invoices_usecase.dart';

abstract interface class ManageWithdrawnInvoicesDataSource {
  Future<PaginationResponseWrapper> getManageWithdrawnInvoices(
    GetManageWithdrawnInvoicesParams params,
  );
}

@LazySingleton(as: ManageWithdrawnInvoicesDataSource)
class ManageWithdrawnInvoicesDataSourceImpl
    implements ManageWithdrawnInvoicesDataSource {
  final ApiServices _apiServices;

  ManageWithdrawnInvoicesDataSourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getManageWithdrawnInvoices(
    GetManageWithdrawnInvoicesParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.series.getSeriesInvoiceAll,
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint(
          "error in getManageWithdrawnInvoices in data source=> ${e.message}");
      throw e.message;
    }
  }
}
