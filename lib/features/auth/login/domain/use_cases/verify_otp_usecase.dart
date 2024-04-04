import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class VerifyOtpUsecase
    extends UseCase<Either<String, dynamic>, VerifyOtpParams> {
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

  VerifyOtpParams({
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'email': email,
    };
  }
}
