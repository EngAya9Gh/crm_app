import 'package:crm_smart/features/finance/verified_invoice/domain/use_cases/verified_invoice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/clients_attachments_repo.dart';
import '../data_sources/verified_invoice_datasource.dart';

@Injectable(as: VerifiedInvoiceRepository)
class VerifiedInvoiceRepoImpl implements VerifiedInvoiceRepository {
  final VerifiedInvoicesDatasource datasource;

  VerifiedInvoiceRepoImpl(this.datasource);

  @override
  Future<Either<String, List<InvoiceModel>>> getVerifiedInvoice() async {
    try {
      final data = await datasource.getVerifiedInvoices();
      return data;
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      return Left(e.toString());
    }
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
