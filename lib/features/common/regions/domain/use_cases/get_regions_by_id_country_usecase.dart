import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/region_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/regions_repository.dart';

@lazySingleton
class GetRegionsByIdCountryUseCase extends BaseUsecase<
    Either<String, List<RegionModel>>, GetRegionsByIdCountryParams> {
  final RegionsRepository repository;

  GetRegionsByIdCountryUseCase(this.repository);

  @override
  Future<Either<String, List<RegionModel>>> call(
    GetRegionsByIdCountryParams params,
  ) {
    return repository.getRegionsByIdCountry(params);
  }
}

class GetRegionsByIdCountryParams {
  final String fkCountry;

  const GetRegionsByIdCountryParams({
    required this.fkCountry,
  });

  Map<String, dynamic> toMap() {
    return {
      'fk_country': fkCountry,
    };
  }
}
