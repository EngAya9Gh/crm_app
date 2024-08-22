import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../model/maincitymodel.dart';
import '../repositories/cities_repository.dart';

@lazySingleton
class GetCitiesUseCase
    extends BaseUsecase<Either<String, List<CityModel>>, GetCitiesParams> {
  final CitiesRepository repository;

  GetCitiesUseCase(this.repository);

  @override
  Future<Either<String, List<CityModel>>> call(GetCitiesParams params) {
    return repository.getCities(params);
  }
}

class GetCitiesParams {
  final String fkCountry;
  final String? regionId;

  GetCitiesParams({
    required this.fkCountry,
    this.regionId,
  });
}
