import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/cache_token_usecase.dart';
import '../../../domain/use_cases/get_token_usecase.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/validate_token_usecase.dart';
import '../../../domain/use_cases/verify_otp_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final CacheTokenUsecase _cacheTokenUsecase;
  final GetTokenUsecase _getTokenUsecase;
  final ValidateTokenUsecase _validateTokenUsecase;

  LoginCubit(
    this._loginUsecase,
    this._verifyOtpUsecase,
    this._cacheTokenUsecase,
    this._getTokenUsecase,
    this._validateTokenUsecase,
  ) : super(LoginInitial());

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();
  final otpCodeController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    final result = await _loginUsecase(
      LoginParams(email: emailController.text),
    );
    result.fold(
      (error) => emit(LoginFailure(error)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> verifyOtp() async {
    emit(VerifyOtpLoading());
    final result = await _verifyOtpUsecase(
      VerifyOtpParams(
        otp: otpCodeController.text,
        email: emailController.text,
      ),
    );
    result.fold(
      (error) => emit(VerifyOtpFailure(error)),
      (token) {
        cacheToken(token);
        emit(VerifyOtpSuccess());
      },
    );
  }

  Future<void> cacheToken(String token) async {
    final result = await _cacheTokenUsecase(CacheTokenParams(token: token));
    result.fold(
      (error) => print('Error caching token: $error'),
      (_) => print('Token cached successfully'),
    );
  }

  Future<String?> getToken() async {
    final result = await _getTokenUsecase(GetTokenParams());
    return result.fold(
      (error) {
        emit(LoginFailure(error));
        return null;
      },
      (cachedToken) {
        emit(LoginSuccess());
        return cachedToken;
      },
    );
  }

  Future<bool?> validateToken() async {
    emit(ValidateTokenLoading());
    final result = await _validateTokenUsecase(ValidateTokenParams());
    return result.fold(
      (error) {
        emit(ValidateTokenFailure(error));
        return null;
      },
      (isValid) {
        emit(ValidateTokenSuccess());
        return isValid;
      },
    );
  }
}
