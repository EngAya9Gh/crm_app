import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/validate_token_usecase.dart';
import '../../domain/use_cases/verify_otp_usecase.dart';

abstract class LoginRemoteDataSource {
  Future<Either<String, dynamic>> login(LoginParams loginParams);

  Future<Either<String, dynamic>> verifyOtp(VerifyOtpParams verifyOtpParams);

  Future<PaginationResponseWrapper> validateToken(
    ValidateTokenParams validateTokenParams,
  );

  Future<Map<String, dynamic>> saveTelegramUsername(String email, String telegramUsername);
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiServices _apiServices;

  LoginRemoteDataSourceImpl(this._apiServices);

  @override
  Future<Either<String, dynamic>> login(LoginParams loginParams) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      await _apiServices.post(
        endPoint: EndPoints.auth.login,
        data: loginParams.toMap(),
      );
      return Right(null);
    } on BaseAppException catch (e) {
      debugPrint("error in login => ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in login => $e");
      return Left("error in login");
    }
  }

  @override
  Future<PaginationResponseWrapper> validateToken(
      ValidateTokenParams validateTokenParams) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.auth.validateToken,
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in validateToken in datasource => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future<Either<String, dynamic>> verifyOtp(
    VerifyOtpParams verifyOtpParams,
  ) async {
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    try {
      final response = await _apiServices.post(
        endPoint: EndPoints.auth.verifyOtp,
        data: verifyOtpParams.toMap(),
      );
      final token = apiDataHandler(response);
      return Right(token);
    } on BaseAppException catch (e) {
      debugPrint("error in verifyOtp 1 => ${e.message}");
      return Left("Wrong OTP");
    } catch (e, s) {
      debugPrint("error in verifyOtp 2 => $e");
      debugPrintStack(stackTrace: s);
      return Left("error in verifyOtp");
    }
  }

  @override
  Future<Map<String, dynamic>> saveTelegramUsername(String email, String telegramUsername) async {
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _apiServices.post(
      endPoint:  EndPoints.auth.saveTelegramUsername,
      data: {
        'email': email,
        'telegram_username': telegramUsername,
      },
    );
    return response;
  }
}
