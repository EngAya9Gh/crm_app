import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/regions_repository.dart';

@lazySingleton
class GetRegionsUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetRegionsParams> {
  final RegionsRepository repository;

  GetRegionsUseCase(this.repository);

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetRegionsParams params,
  ) {
    return repository.getRegions(params);
  }
}

class GetRegionsParams {
  final String fkCountry;

  GetRegionsParams({
    required this.fkCountry,
  });

  Map<String, dynamic> toParams() {
    return {
      "fk_country": fkCountry,
    };
  }
}
