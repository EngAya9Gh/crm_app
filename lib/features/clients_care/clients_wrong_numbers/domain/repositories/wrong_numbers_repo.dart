import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_wrong_numbers_usecase.dart';

abstract class WrongNumbersRepo {
  Future<Either<String, PaginationResponseWrapper>> getWrongNumbers(
    GetWrongNumbersParams params,
  );
}
