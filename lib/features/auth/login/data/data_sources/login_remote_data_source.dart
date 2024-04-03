import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/server_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/validate_token_usecase.dart';
import '../../domain/use_cases/verify_otp_usecase.dart';

abstract class LoginRemoteDataSource {
  Future<Either<String, dynamic>> login(LoginParams loginParams);

  Future<Either<String, void>> verifyOtp(VerifyOtpParams verifyOtpParams);

  Future<Either<String, void>> validateToken(
    ValidateTokenParams validateTokenParams,
  );
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiServices _apiServices;

  LoginRemoteDataSourceImpl(this._apiServices) {
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
  }

  @override
  Future<Either<String, dynamic>> login(LoginParams loginParams) async {
    try {
      await _apiServices.post(
        endPoint: EndPoints.auth.login,
        data: loginParams.toMap(),
      );
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, dynamic>> validateToken(
      ValidateTokenParams validateTokenParams) async {
    try {
      final response = await _apiServices.post(
        endPoint: EndPoints.auth.validateToken,
      );
      final token = apiDataHandler(response);
      return Right(token);
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, void>> verifyOtp(
      VerifyOtpParams verifyOtpParams) async {
    try {
      final response = await _apiServices.post(
        endPoint: EndPoints.auth.verifyOtp,
        data: verifyOtpParams.toMap(),
      );
      final token = apiDataHandler(response);
      return Right(token);
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }
}
