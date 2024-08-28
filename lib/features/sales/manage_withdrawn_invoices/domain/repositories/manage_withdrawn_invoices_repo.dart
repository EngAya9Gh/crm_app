import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_manage_withdrawn_invoices_usecase.dart';

abstract interface class ManageWithdrawnInvoicesRepo {
  Future<Either<String, PaginationResponseWrapper>> getManageWithdrawnInvoices(
      GetManageWithdrawnInvoicesParams params);
}
