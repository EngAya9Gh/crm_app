import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_not_using_system_usecase.dart';

abstract class NotUsingSystemRepo {
  Future<Either<String, PaginationResponseWrapper>> getNotUsingSystem(
    GetNotUsingSystemParams params,
  );
}
