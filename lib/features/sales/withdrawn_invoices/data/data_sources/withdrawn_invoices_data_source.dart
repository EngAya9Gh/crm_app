import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_withdrawn_invoices_usecase.dart';

abstract interface class WithdrawnInvoicesDataSource {
  Future<PaginationResponseWrapper> getWithdrawnInvoices(
    GetWithdrawnInvoicesParams params,
  );
}

@LazySingleton(as: WithdrawnInvoicesDataSource)
class WithdrawnInvoicesDataSourceImpl implements WithdrawnInvoicesDataSource {
  final ApiServices _apiServices;

  WithdrawnInvoicesDataSourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getWithdrawnInvoices(
    GetWithdrawnInvoicesParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.invoice.getwithdrawInvoices,
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getWithdrawnInvoices in data source=> ${e.message}");
      throw e.message;
    }
  }
}
