import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../use_cases/verified_invoice_usecase.dart';

abstract class VerifiedInvoiceRepository {
  Future<Either<String, List<InvoiceModel>>> getVerifiedInvoice();
  Future<Either<String, InvoiceModel>> verifiedInvoice(VerifiedInvoiceParams params);
}
