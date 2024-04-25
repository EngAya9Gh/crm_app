import 'package:dartz/dartz.dart';

import '../../../../../../model/invoiceModel.dart';
import '../use_cases/get_invoices_by_privileges_usecase.dart';

abstract interface class InvoicesTabRepo {
  Future<Either<String, List<InvoiceModel>>> getInvoiceByPrivileges(
      GetInvoicesByPrivilegesParams params);
}
