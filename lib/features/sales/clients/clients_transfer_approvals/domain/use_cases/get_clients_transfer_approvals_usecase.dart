import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_transfer_approvals_repo.dart';

@lazySingleton
class GetClientsTransferApprovalsUsecase extends BaseUsecase<
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
