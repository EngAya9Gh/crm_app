import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_deleted_invoices_usecase.dart';

abstract interface class DeletedInvoicesDatasource {
  Future<PaginationResponseWrapper> getDeletedInvoices(
    GetDeletedParams params,
  );
}

@LazySingleton(as: DeletedInvoicesDatasource)
class DeletedInvoicesDatasourceImpl implements DeletedInvoicesDatasource {
  final ApiServices _apiServices;

  DeletedInvoicesDatasourceImpl(this._apiServices);

  @override
  Future<PaginationResponseWrapper> getDeletedInvoices(
    GetDeletedParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.invoice.getdeletedInvoices,
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getDeletedInvoices in data source=> ${e.message}");
      throw e.message;
    }
  }
}
