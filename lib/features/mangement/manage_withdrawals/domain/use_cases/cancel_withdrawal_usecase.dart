import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/manage_withdrawals_repository.dart';

@lazySingleton
class CancelWithdrawalUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, CancelWithdrawalParams> {
  CancelWithdrawalUsecase(this._repository);

  final ManageWithdrawalsRepository _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
      CancelWithdrawalParams params) {
    return _repository.cancelWithdrawal(params);
  }
}

class CancelWithdrawalParams {
  const CancelWithdrawalParams({
    required this.idInvoice,
  });

  final String idInvoice;
}
