import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_privileges_usecase.dart';
import '../use_cases/update_privileges_usecase.dart';

abstract class PrivilegesRepo {
  Future<Either<String, PaginationResponseWrapper>> getPrivileges(
    GetPrivilegesParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> updatePrivileges(
    UpdatePrivilegesParams params,
  );
}
