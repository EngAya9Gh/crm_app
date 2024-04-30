import 'package:dartz/dartz.dart';

import '../use_cases/get_invoices_by_privileges_usecase.dart';

abstract interface class InvoicesTabRepo {
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
      GetInvoicesByPrivilegesParams params);
}
