import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/core/services/firebase_analytics_services.dart';
import 'package:crm_smart/features/home/presentation/pages/home_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../domain/use_cases/cache_token_usecase.dart';
import '../../../domain/use_cases/get_token_usecase.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/validate_token_usecase.dart';
import '../../../domain/use_cases/verify_otp_usecase.dart'; 
import '../../../domain/use_cases/save_telegram_username_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final CacheTokenUsecase _cacheTokenUsecase;
  final GetTokenUsecase _getTokenUsecase;
  final ValidateTokenUsecase _validateTokenUsecase;
  final SaveTelegramUsernameUseCase _saveTelegramUsernameUseCase;

  LoginCubit(
    this._loginUsecase,
    this._verifyOtpUsecase,
    this._cacheTokenUsecase,
    this._getTokenUsecase,
    this._validateTokenUsecase,
    this._saveTelegramUsernameUseCase,
  ) : super(LoginState());

  // final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  // final otpFormKey = GlobalKey<FormState>();
  final otpCodeController = TextEditingController();

  Future<void> login() async {
    emit(state.copyWith(loginStatus: const BlocStatus.loading()));
    final result = await _loginUsecase(
      LoginParams(email: emailController.text),
    );
    //emit(state.copyWith(loginStatus: const BlocStatus.success()));
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
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String deviceDetails;
    final fcm = await _getFcm();
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceDetails = "web ${webInfo.userAgent}";
    }
    // else if (Theme.of(context).platform == TargetPlatform.android) {
    //   AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    //   deviceDetails = 'Android ${androidInfo.version.release} - ${androidInfo.model}';
    // } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    //   IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    //   deviceDetails = 'iOS ${iosInfo.utsname.release} - ${iosInfo.utsname.machine}';
    // }
    else {
      deviceDetails = 'Unsupported platform';
    }

    final result = await _verifyOtpUsecase(
      VerifyOtpParams(
        otp: otpCodeController.text,
        email: emailController.text,
        token: fcm,
        userAgent: deviceDetails,
      ),
    );
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(
            verifyOtpStatus: BlocStatus.fail(error: "Wrong OTP")));
      },
      (token) async {
        await cacheToken(token);
        await AnalyticsService().logLogIn(email: emailController.text);
        await Provider.of<UserProvider>(context, listen: false)
            .getCurrentUser();
        AppNavigator.go(HomePage(), name: AppRoutesNames.generalRoutes.home);
        emit(state.copyWith(verifyOtpStatus: const BlocStatus.success()));
        _clearControllers();
      },
    );
  }

  Future<String?> _getFcm() async {
    try {
      var token = await FirebaseMessaging.instance.getToken();
      log('34567890${token}');
      return token;
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

  Future<({bool success, String? message})> saveTelegramUsername(
      String email, String telegramUsername) async {
    try {
      final response =
          await _saveTelegramUsernameUseCase(email, telegramUsername);
      if (response['success'] == true) {
        return (success: true, message: response['message'] as String?);
      } else {
        return (success: false, message: response['message'] as String?);
      }
    } catch (e) {
      return (success: false, message: 'خطأ في الاتصال بالخادم');
    }
  }
}
