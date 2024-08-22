import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class GetTokenUsecase
    extends BaseUsecase<Either<String, dynamic>, GetTokenParams> {
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
