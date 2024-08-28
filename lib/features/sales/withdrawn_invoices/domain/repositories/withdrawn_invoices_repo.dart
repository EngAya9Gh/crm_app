import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_withdrawn_invoices_usecase.dart';

abstract interface class WithdrawnInvoicesRepo {
  Future<Either<String, PaginationResponseWrapper>> getWithdrawnInvoices(
      GetWithdrawnInvoicesParams params);
}
