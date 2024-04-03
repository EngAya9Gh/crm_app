import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class LoginUsecase extends UseCase<Either<String, dynamic>, LoginParams> {
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
