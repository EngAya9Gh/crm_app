import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/finance_pending_repo.dart';

@lazySingleton
class GetFinancePendingInvoicesUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>,
    GetFinancePendingInvoicesParams> {
  GetFinancePendingInvoicesUsecase(this._repository);

  final FinancePendingRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetFinancePendingInvoicesParams params,
  ) async {
    return await _repository.getFinancePendingInvoices(params);
  }
}

class GetFinancePendingInvoicesParams {
  const GetFinancePendingInvoicesParams();
}
