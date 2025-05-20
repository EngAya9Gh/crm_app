import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/cache_token_usecase.dart';
import '../use_cases/get_token_usecase.dart';
import '../use_cases/login_usecase.dart';
import '../use_cases/validate_token_usecase.dart';
import '../use_cases/verify_otp_usecase.dart';

abstract class LoginRepo {
  Future<Either<String, dynamic>> login(
    LoginParams loginParams,
  );

  Future<Either<String, dynamic>> verifyOtp(VerifyOtpParams verifyOtpParams);

  Future<Either<String, PaginationResponseWrapper>> validateToken(
    ValidateTokenParams validateTokenParams,
  );

  Future<Either<String, dynamic>> getToken(GetTokenParams getTokenParams);

  Future<Either<String, dynamic>> cacheToken(CacheTokenParams cacheTokenParams);

  Future<Map<String, dynamic>> saveTelegramUsername(String email, String telegramUsername);
}
