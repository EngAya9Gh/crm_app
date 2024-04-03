import 'package:crm_smart/features/auth/login/domain/use_cases/cache_token_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/login_repository.dart';
import '../../domain/use_cases/get_token_usecase.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/validate_token_usecase.dart';
import '../../domain/use_cases/verify_otp_usecase.dart';
import '../data_sources/login_local_data_source.dart';
import '../data_sources/login_remote_data_source.dart';

@LazySingleton(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _remoteDatasource;
  final LoginLocalDataSource _localDataSource;

  LoginRepoImpl(
    this._remoteDatasource,
    this._localDataSource,
  );

  @override
  Future<Either<String, dynamic>> login(LoginParams loginParams) {
    return _remoteDatasource.login(loginParams);
  }

  @override
  Future<Either<String, dynamic>> validateToken(
      ValidateTokenParams validateTokenParams) {
    return _remoteDatasource.validateToken(validateTokenParams);
  }

  @override
  Future<Either<String, dynamic>> verifyOtp(VerifyOtpParams verifyOtpParams) {
    return _remoteDatasource.verifyOtp(verifyOtpParams);
  }

  @override
  Future<Either<String, dynamic>> getToken(GetTokenParams getTokenParams) {
    return _localDataSource.getToken(getTokenParams);
  }

  @override
  Future<Either<String, dynamic>> cacheToken(
    CacheTokenParams cacheTokenParams,
  ) {
    return _localDataSource.cacheToken(cacheTokenParams);
  }
}
