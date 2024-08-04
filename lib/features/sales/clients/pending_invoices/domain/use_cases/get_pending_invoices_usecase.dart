import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/pending_invoices_repo.dart';

@lazySingleton
class GetPendingInvoicesUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetPendingInvoicesParams> {
  GetPendingInvoicesUsecase(this._repository);

  final PendingInvoicesRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetPendingInvoicesParams params,
  ) async {
    return await _repository.getPendingInvoices(params);
  }
}

class GetPendingInvoicesParams {
  final String? fkRegion;

  const GetPendingInvoicesParams({
    this.fkRegion,
  });

  // to params
  Map<String, dynamic> toParams() {
    return {
      'fk_region': fkRegion,
    }..removeWhere((key, value) => value == null);
  }
}
