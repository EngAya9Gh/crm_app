import 'package:bloc/bloc.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

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

  Future<void> verifyOtp(BuildContext context) async {
    emit(VerifyOtpLoading());

    final fcm = await FirebaseMessaging.instance.getToken();

    final result = await _verifyOtpUsecase(
      VerifyOtpParams(
        otp: otpCodeController.text,
        email: emailController.text,
        token: fcm,
      ),
    );
    result.fold(
      (error) => emit(VerifyOtpFailure(error)),
      (token) async {
        cacheToken(token);
        _clearControllers();
        emit(VerifyOtpSuccess(isActive: await _isActiveUser(context)));
      },
    );
  }

  Future<bool?> _isActiveUser(BuildContext context) async {
    final user = await context.read<UserProvider>().getCurrentUser();
    return user?.isActive != '0';
  }

  void _clearControllers() {
    emailController.clear();
    otpCodeController.clear();
  }

  Future<void> cacheToken(String token) async {
    final result = await _cacheTokenUsecase(CacheTokenParams(token: token));
    result.fold(
      (error) => debugPrint('Error caching token: $error'),
      (_) => debugPrint('Token cached successfully'),
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
