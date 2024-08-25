import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/add_level_usecase.dart';
import '../use_cases/get_levels_usecase.dart';

abstract class LevelsRepo {
  Future<Either<String, PaginationResponseWrapper>> getLevels(
    GetLevelsParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> addLevel(
    AddLevelParams params,
  );
}
