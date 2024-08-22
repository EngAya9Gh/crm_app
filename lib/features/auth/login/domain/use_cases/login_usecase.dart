import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class LoginUsecase extends BaseUsecase<Either<String, dynamic>, LoginParams> {
  LoginUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, dynamic>> call(LoginParams params) async {
    return await _repository.login(params);
  }
}

class LoginParams {
  final String email;

  LoginParams({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }
}
