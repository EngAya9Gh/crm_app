import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_support_clients_accept_use_case.dart';

abstract class SupportClientsAcceptRepository {
  Future<Either<String, PaginationResponseWrapper>> getClientsAccept(
    GetSupportClientsAcceptParams params,
  );
}
