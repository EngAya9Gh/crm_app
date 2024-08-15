import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_transfer_approvals_usecase.dart';

abstract class ClientsTransferApprovalsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsTransferApprovals(
    GetClientsTransferApprovalsParams params,
  );
}
