import 'package:crm_smart/features/app/presentation/pages/not_allowed_page.dart';
import 'package:crm_smart/features/app/presentation/pages/update_app_page.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/verify_otp_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../api/api.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../services/cache_services/cache_services.dart';
import '../../services/cache_services/secure_storage_consumer.dart';
import '../../services/di/di_container.dart';
import '../../utils/app_strings.dart';
import 'app_routes_paths.dart';

class AppRedirections {
  static Future<String?> handleRedirection(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (!kIsWeb) return null;

    String? loginRedirect = await _handleLoginRedirection(context, state);
    if (loginRedirect != null) {
      return loginRedirect;
    }

    String? otpRedirect = _handleOtpRedirection(context, state);
    if (otpRedirect != null) {
      return otpRedirect;
    }

    if (context.read<UserProvider>().currentUser.idUser == '-1') {
      if (_shouldCheckForLogin(context, state)) {
        String? loginRedirect = await _checkForLogin(context);
        if (loginRedirect != null) {
          return loginRedirect;
        }
      }
    }

    return null;
  }

  // if user in login page and token is valid, redirect to home page
  static Future<String?> _handleLoginRedirection(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (!kIsWeb) return null;
    final path = state.fullPath;
    if (path == AppRoutesPaths.routeFullPathByName[LoginPage().toString()]) {
      final tokenState = await _validateToken(context);
      UserModel? user = await _getUser(context);

      if (tokenState && user != null) {
        if (user.isActive == '0') {
          return AppRoutesPaths
              .routeFullPathByName[NotAllowedPage().toString()];
        }
        return AppRoutesPaths.routeFullPathByName[HomePage().toString()];
      }
    }
    return null;
  }

  static String? _handleOtpRedirection(
    BuildContext context,
    GoRouterState state,
  ) {
    if (!kIsWeb) return null;
    final path = state.fullPath;
    if (path ==
        AppRoutesPaths.routeFullPathByName[VerifyOtpPage().toString()]) {
      final extra = state.extra as String?;
      if (extra?.isEmpty ?? true) {
        return AppRoutesPaths.routeFullPathByName[LoginPage().toString()];
      }
      return AppRoutesPaths.routeFullPathByName[VerifyOtpPage().toString()];
    }
    return null;
  }

  static bool _shouldCheckForLogin(BuildContext context, GoRouterState state) {
    final path = state.fullPath;
    if (path == null) return false;
    if (path ==
            AppRoutesPaths.routeFullPathByName[VerifyOtpPage().toString()] ||
        path == AppRoutesPaths.routeFullPathByName[LoginPage().toString()] ||
        path == AppRoutesPaths.routeFullPathByName[SplashScreen().toString()] ||
        path ==
            AppRoutesPaths.routeFullPathByName[UpdateAppPage().toString()]) {
      return false;
    }

    return true;
  }

  static Future<String?> _checkForLogin(BuildContext context) async {
    final tokenState = await _validateToken(context);
    if (!tokenState) {
      _clearToken();
      return AppRoutesPaths.routeFullPathByName[LoginPage().toString()];
    }

    UserModel? user = await _getUser(context);
    if (user == null) {
      return AppRoutesPaths.routeFullPathByName[LoginPage().toString()];
    }

    if (user.isActive == '0') {
      return AppRoutesPaths.routeFullPathByName[NotAllowedPage().toString()];
    }

    return null;
  }

  static Future<bool> _validateToken(BuildContext context) async {
    final bool? tokenState = await isTokenValid(context);
    if (tokenState == true) return true;
    if (tokenState == false) return false;
    throw Exception();
  }

  static Future<bool?> isTokenValid(BuildContext context) async {
    try {
      return await context.read<LoginCubit>().validateToken();
    } catch (e) {
      return false;
    }
  }

  static Future<UserModel?> _getUser(BuildContext context) async {
    try {
      final UserProvider userProvider = context.read<UserProvider>();
      await userProvider.getCurrentUser();

      return userProvider.currentUser;
    } catch (e) {
      return null;
    }
  }

  static Future<void> _clearToken() async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    await secureStorage.removeData(key: AppStrings.secureStorage.token);
    Api.token = null;
  }
}
