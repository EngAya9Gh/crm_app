import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/verified_invoice_usecase.dart';
@injectable
class VerifiedInvoicesDatasource {
  final ApiServices api;

  VerifiedInvoicesDatasource(this.api);

  Future<Either<String, List<InvoiceModel>>> getVerifiedInvoices() async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.finance.getVerifiedInvoice,
      );

      return Right(List.from((response['message'] as List<dynamic>).map((e) {
        return InvoiceModel.fromJson(e as Map<String, dynamic>);
      })));
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
