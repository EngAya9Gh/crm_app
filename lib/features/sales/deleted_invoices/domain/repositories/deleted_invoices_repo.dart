import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_deleted_invoices_usecase.dart';

abstract interface class DeletedInvoicesRepo {
  Future<Either<String, PaginationResponseWrapper>> getDeletedInvoices(
      GetDeletedParams params);
}
