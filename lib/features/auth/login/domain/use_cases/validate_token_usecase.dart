import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class ValidateTokenUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, ValidateTokenParams> {
  ValidateTokenUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
      ValidateTokenParams params) async {
    return await _repository.validateToken(params);
  }
}

class ValidateTokenParams {}
