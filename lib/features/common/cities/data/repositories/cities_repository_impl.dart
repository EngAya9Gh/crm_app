import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/maincitymodel.dart';
import '../../domain/repositories/cities_repository.dart';
import '../../domain/use_cases/get_cities_usecase.dart';
import '../data_sources/cities_datasource.dart';

@LazySingleton(as: CitiesRepository)
class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesDatasource datasource;

  CitiesRepositoryImpl(this.datasource);

  Future<Either<String, List<CityModel>>> getCities(
    GetCitiesParams params,
  ) async {
    try {
      final result = await datasource.getCities(params);

      final List<CityModel> citiesList = List<CityModel>.from(result.map((e) {
        return CityModel.fromJson(e);
      }));

      return Right(citiesList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
