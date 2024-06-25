import '../repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';

@lazySingleton
class ValidateTokenUsecase
    extends UseCase<Either<String, dynamic>, ValidateTokenParams> {
  ValidateTokenUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, dynamic>> call(ValidateTokenParams params) async {
    return await _repository.validateToken(params);
  }
}

class ValidateTokenParams {}
