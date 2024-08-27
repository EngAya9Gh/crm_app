import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/cities_repository.dart';

@lazySingleton
class GetCitiesUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetCitiesParams> {
  final CitiesRepository repository;

  GetCitiesUseCase(this.repository);

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
      GetCitiesParams params) {
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

  Map<String, dynamic> toParams() {
    return {
      "fk_country": fkCountry,
      if (regionId != null) "fk_maincity": regionId,
    };
  }
}
