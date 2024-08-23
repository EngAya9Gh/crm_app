import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_regions_use_case.dart';

abstract class RegionsRepository {
  Future<Either<String, PaginationResponseWrapper>> getRegions(
    GetRegionsParams params,
  );
}
