import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_finance_pending_invoices_usecase.dart';

abstract class FinancePendingRepo {
  Future<Either<String, PaginationResponseWrapper>> getFinancePendingInvoices(
    GetFinancePendingInvoicesParams params,
  );
}
