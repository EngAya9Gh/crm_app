import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../use_cases/verified_invoice_usecase.dart';

abstract class VerifiedInvoiceRepository {
  Future<Either<String, List<InvoiceModel>>> getVerifiedInvoice(GetInvoicesByPrivilegesParams params);
  Future<Either<String, InvoiceModel>> verifiedInvoice(VerifiedInvoiceParams params);
}
