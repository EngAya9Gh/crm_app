import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_constants.dart';
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
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(LoginFailure(error));
      },
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> verifyOtp(BuildContext context) async {
    emit(VerifyOtpLoading());

    final fcm = await _getFcm();

    final result = await _verifyOtpUsecase(
      VerifyOtpParams(
        otp: otpCodeController.text,
        email: emailController.text,
        token: fcm,
      ),
    );
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(VerifyOtpFailure(error));
      },
      (token) async {
        await cacheToken(token);
        await context.read<AppManagerCubit>().checkRedirections(context);
        _clearControllers();
      },
    );
  }

  Future<String?> _getFcm() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
    }
    return null;
  }

  void _clearControllers() {
    emailController.clear();
    otpCodeController.clear();
  }

  Future<void> cacheToken(String token) async {
    final result = await _cacheTokenUsecase(CacheTokenParams(token: token));
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        debugPrint('Error caching token: $error');
      },
      (_) => debugPrint('Token cached successfully'),
    );
  }

  Future<String?> getToken() async {
    final result = await _getTokenUsecase(GetTokenParams());
    return result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
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
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(ValidateTokenFailure(error));
        return null;
      },
      (data) {
        emit(ValidateTokenSuccess());
        return data.data;
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    otpCodeController.dispose();
    return super.close();
  }
}
