import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_support_clients_invoices_use_case.dart';

abstract class SupportClientsInvoicesRepo {
  Future<Either<String, PaginationResponseWrapper>> getSupportClientInvoices(
    GetSupportClientsInvoicesParams params,
  );
}
