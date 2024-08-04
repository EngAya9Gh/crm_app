import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/clients_transfer_approvals_repo.dart';

@lazySingleton
class GetClientsTransferApprovalsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>,
    GetClientsTransferApprovalsParams> {
  GetClientsTransferApprovalsUsecase(this._repository);

  final ClientsTransferApprovalsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsTransferApprovalsParams params,
  ) async {
    return await _repository.getClientsTransferApprovals(params);
  }
}

class GetClientsTransferApprovalsParams {
  const GetClientsTransferApprovalsParams();
}
