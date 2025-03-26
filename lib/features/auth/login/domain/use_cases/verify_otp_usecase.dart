import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class VerifyOtpUsecase
    extends BaseUsecase<Either<String, dynamic>, VerifyOtpParams> {
  VerifyOtpUsecase(this._repository);

  final LoginRepo _repository;

  @override
  Future<Either<String, dynamic>> call(VerifyOtpParams params) async {
    return await _repository.verifyOtp(params);
  }
}

class VerifyOtpParams {
  final String otp;
  final String email;
  final String? token;
  final String userAgent;

  VerifyOtpParams({
    required this.otp,
    required this.email,
    this.token,
    required this.userAgent,
  });

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'email': email,
      'token': token,
      'user_agent': userAgent,
    };
  }
}
