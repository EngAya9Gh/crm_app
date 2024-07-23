import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_accept_usecase.dart';

abstract class ClientsAcceptRepository {
  Future<Either<String, PaginationResponseWrapper>> getClientsAccept(
    GetClientsAcceptParams params,
  );
}
