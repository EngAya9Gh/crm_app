import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_cities_usecase.dart';

abstract class CitiesRepository {
  Future<Either<String, PaginationResponseWrapper>> getCities(
      GetCitiesParams params);
}
