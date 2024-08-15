import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_previous_ratings_usecase.dart';

abstract class PreviousRatingsRepo {
  Future<Either<String, PaginationResponseWrapper>> getPreviousRatings(
    GetPreviousRatingsParams params,
  );
}
