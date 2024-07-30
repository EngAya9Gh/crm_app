import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/exceeded_clients_use_case.dart';
import '../use_cases/transfer_exceeded_clients_use_case.dart';

abstract class ExceededClientsRepo {
  Future<Either<String, PaginationResponseWrapper>> getExceededClients(
    ExceededClientsParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> transferExceededClients(
    TransferExceededClientsParams params,
  );
}
