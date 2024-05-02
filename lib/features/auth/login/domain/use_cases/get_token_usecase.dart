import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class GetTokenUsecase extends UseCase<Either<String, dynamic>, GetTokenParams> {
  GetTokenUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, dynamic>> call(GetTokenParams params) async {
    return await _repository.getToken(params);
  }
}

class GetTokenParams {
  const GetTokenParams();
}
