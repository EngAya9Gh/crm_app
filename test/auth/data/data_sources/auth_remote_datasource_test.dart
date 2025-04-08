import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/validate_token_usecase.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/verify_otp_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late LoginRemoteDataSource loginRemoteDataSource;

  setUp(() {
    mockApiServices = MockApiServices();
    loginRemoteDataSource = LoginRemoteDataSourceImpl(mockApiServices);
  });

  group("Login Remote DataSource", () {
    test("login success", () async {
      // Arrange
      final loginParams = LoginParams(email: "abdullah.bokl@gmail.com");
      when(mockApiServices.post(
        endPoint: EndPoints.auth.login,
        data: loginParams.toMap(),
      )).thenAnswer((_) async => null);

      // Act
      final result = await loginRemoteDataSource.login(loginParams);

      // Assert
      verify(mockApiServices.post(
        endPoint: EndPoints.auth.login,
        data: loginParams.toMap(),
      )).called(1);
      expect(result, equals(Right<String, dynamic>(null)));
    });

    test("verifyOtp success", () async {
      // Arrange
      final verifyOtpParams = VerifyOtpParams(
        email: "abdullah.bokl@gmail.com",
        otp: "12345",
        token: "token",
        userAgent: "test",
      );
      when(mockApiServices.post(
        endPoint: EndPoints.auth.verifyOtp,
        data: verifyOtpParams.toMap(),
      )).thenAnswer((_) async => {"data": "token"});

      // Act
      final result = await loginRemoteDataSource.verifyOtp(verifyOtpParams);

      // Assert
      verify(mockApiServices.post(
        endPoint: EndPoints.auth.verifyOtp,
        data: verifyOtpParams.toMap(),
      )).called(1);
      expect(result, equals(Right<String, dynamic>("token")));
    });

    test("validateToken success", () async {
      // Arrange
      when(mockApiServices.post(
        endPoint: EndPoints.auth.validateToken,
      )).thenAnswer((_) async => {"data": "token"});

      // Act
      final result =
          await loginRemoteDataSource.validateToken(ValidateTokenParams());

      // Assert
      verify(mockApiServices.post(
        endPoint: EndPoints.auth.validateToken,
      )).called(1);
      expect(result, equals(Right<String, dynamic>("token")));
    });
  });
}
