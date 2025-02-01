import 'package:crm_smart/features/finance/verified_invoice/domain/use_cases/verified_invoice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../domain/repositories/verified_invoice_repo.dart';
import '../data_sources/verified_invoice_datasource.dart';

@Injectable(as: VerifiedInvoiceRepository)
class VerifiedInvoiceRepoImpl implements VerifiedInvoiceRepository {
  final VerifiedInvoicesDatasource datasource;

  VerifiedInvoiceRepoImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> getVerifiedInvoice(GetInvoicesByPrivilegesParams params) async {
    // return datasource.getVerifiedInvoices(params);
    return toApiResult(() async => await datasource.getVerifiedInvoices(params));
    // try {
    //   final data = await datasource.getVerifiedInvoices(params);
    //   return data;
    // } catch (e) {
    //   debugPrint("error in verified invoice in repo => $e");
    //   return Left(e.toString());
    // }
  }

  @override
  Future<Either<String, InvoiceModel>> verifiedInvoice(VerifiedInvoiceParams params) async {
    try {
      final data = await datasource.verifiedStatus(params);
      return data;
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      return Left(e.toString());
    }
  }
}
