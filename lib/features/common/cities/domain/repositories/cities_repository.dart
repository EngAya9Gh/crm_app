import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/location/city_model.dart';
import '../use_cases/get_cities_usecase.dart';

abstract class CitiesRepository {
  Future<Either<String, List<CityModel>>> getCities(GetCitiesParams params);
}
