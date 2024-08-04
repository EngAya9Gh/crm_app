import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_pending_invoices_usecase.dart';

abstract class PendingInvoicesRepo {
  Future<Either<String, PaginationResponseWrapper>> getPendingInvoices(
    GetPendingInvoicesParams params,
  );
}
