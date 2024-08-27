import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/location/city_model.dart';
import '../../domain/repositories/cities_repository.dart';
import '../../domain/use_cases/get_cities_usecase.dart';
import '../data_sources/cities_datasource.dart';

@LazySingleton(as: CitiesRepository)
class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesDatasource datasource;

  CitiesRepositoryImpl(this.datasource);

  Future<Either<String, PaginationResponseWrapper>> getCities(
    GetCitiesParams params,
  ) async {
    try {
      final data = await datasource.getCities(params);

      return Right(data.copyWith(
        data: List<CityModel>.from(data.data.map((e) {
          return CityModel.fromJson(e);
        })),
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
