import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_pending_invoices_usecase.dart';

abstract class PendingInvoicesDatasource {
  Future<PaginationResponseWrapper> getPendingInvoices(
    GetPendingInvoicesParams params,
  );
}

@LazySingleton(as: PendingInvoicesDatasource)
class PendingInvoicesDatasourceImpl implements PendingInvoicesDatasource {
  final ApiServices _api;

  const PendingInvoicesDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getPendingInvoices(
      GetPendingInvoicesParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.invoice.pendingApproveAdmin,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getPendingInvoices in datasource => $e");
      throw e.message;
    }
  }
}

//if (regoinfilter != '') param.addAll({'fk_region': regoinfilter});
//     try {
//       final ApiServices apiServices = getIt<ApiServices>();
//       apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
//       final response = await apiServices.get(
//         endPoint: EndPoints.invoice.pendingApproveAdmin,
//         queryParameters: param,
//       );
//
//       final data = apiDataHandler(response);
//
//       final List<InvoiceModel> invoices = List<InvoiceModel>.from(
//           (data ?? []).map((element) => InvoiceModel.fromJson(element)));
//
//       return invoices;
