import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class AddLevelUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, AddLevelParams> {
  AddLevelUsecase(this._repository);

  final LevelsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    AddLevelParams params,
  ) async {
    return await _repository.addLevel(params);
  }
}

class AddLevelParams {
  final String levelName;

  const AddLevelParams({
    required this.levelName,
  });

  Map<String, dynamic> toBody() => {'name_level': levelName};
}
