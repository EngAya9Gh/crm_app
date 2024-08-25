import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/levels_repo.dart';

@lazySingleton
class GetLevelsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetLevelsParams> {
  GetLevelsUsecase(this._repository);

  final LevelsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetLevelsParams params,
  ) async {
    return await _repository.getLevels(params);
  }
}

class GetLevelsParams {
  const GetLevelsParams();
}
