import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class CacheTokenUsecase
    extends UseCase<Either<String, dynamic>, CacheTokenParams> {
  CacheTokenUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, dynamic>> call(CacheTokenParams params) async {
    return await _repository.cacheToken(params);
  }
}

class CacheTokenParams {
  final String token;

  CacheTokenParams({
    required this.token,
  });
}
