import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/home/presentation/pages/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
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
  ) : super(LoginState());

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();
  final otpCodeController = TextEditingController();

  Future<void> login() async {
    emit(state.copyWith(loginStatus: const BlocStatus.loading()));
    final result = await _loginUsecase(
      LoginParams(email: emailController.text),
    );
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(loginStatus: BlocStatus.fail(error: error)));
      },
      (_) => emit(state.copyWith(loginStatus: const BlocStatus.success())),
    );
  }

  Future<void> verifyOtp(BuildContext context) async {
    emit(state.copyWith(verifyOtpStatus: const BlocStatus.loading()));

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
        emit(state.copyWith(verifyOtpStatus: BlocStatus.fail(error: error)));
      },
      (token) async {
        await cacheToken(token);
        AppNavigator.go(
            HomePage(),
            name: AppRoutesNames.generalRoutes.home
        );
        emit(state.copyWith(verifyOtpStatus: const BlocStatus.success()));
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
    emit(state.copyWith(loginStatus: const BlocStatus.loading()));
    final result = await _getTokenUsecase(GetTokenParams());
    return result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(loginStatus: BlocStatus.fail(error: error)));
        return null;
      },
      (cachedToken) {
        emit(state.copyWith(loginStatus: const BlocStatus.success()));
        return cachedToken;
      },
    );
  }

  Future<bool?> validateToken() async {
    emit(state.copyWith(validateTokenStatus: const BlocStatus.loading()));
    final result = await _validateTokenUsecase(ValidateTokenParams());
    return result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(
            state.copyWith(validateTokenStatus: BlocStatus.fail(error: error)));
        return null;
      },
      (data) {
        emit(state.copyWith(validateTokenStatus: const BlocStatus.success()));
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
