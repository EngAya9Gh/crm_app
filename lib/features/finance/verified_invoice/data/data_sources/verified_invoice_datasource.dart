import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/verified_invoice_usecase.dart';

@injectable
class VerifiedInvoicesDatasource {
  final ApiServices api;

  VerifiedInvoicesDatasource(this.api);

  Future<ResponseWrapper<List<InvoiceModel>>> getVerifiedInvoices(GetInvoicesByPrivilegesParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.finance.getVerifiedInvoice,
        queryParameters: params.toMap(),
      );

      return ResponseWrapper<List<InvoiceModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      throw Exception("$e");
    }
  }

  Future<Either<String, InvoiceModel>> verifiedStatus(VerifiedInvoiceParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.finance.deportInvoice(params.invoiceModel.idInvoice!),
      );

      return Right(params.invoiceModel.copyWith());
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      throw Exception("$e");
    }
  }
}
