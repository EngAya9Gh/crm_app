import 'package:dartz/dartz.dart';

import '../../../../../model/maincitymodel.dart';
import '../use_cases/get_cities_usecase.dart';

abstract class CitiesRepository {
  Future<Either<String, List<CityModel>>> getCities(GetCitiesParams params);
}
