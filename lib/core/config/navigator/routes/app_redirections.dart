import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../api/api.dart';
import '../../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../../../model/usermodel.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../services/cache_services/cache_services.dart';
import '../../../services/cache_services/secure_storage_consumer.dart';
import '../../../services/di/di_container.dart';
import '../../../utils/app_strings.dart';
import '../app_routes_names.dart';
import '../app_routes_paths.dart';

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
        String? loginRedirect = await _checkForLogin(context, state);
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
    if (path ==
        AppRoutesPaths.routeFullPathByName(
            AppRoutesNames.generalRoutes.login)||path ==
        AppRoutesPaths.routeFullPathByName(
            AppRoutesNames.generalRoutes.otp)) {
      final tokenState = await _validateToken(context);
      UserModel? user = await _getUser(context);

      if (tokenState && user != null) {
        if (user.isActive == '0') {
          return AppRoutesPaths.routeFullPathByName(
              AppRoutesNames.generalRoutes.notAllowed);
        }
        return AppRoutesPaths.routeFullPathByName(
            AppRoutesNames.generalRoutes.home);
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
        AppRoutesPaths.routeFullPathByName(AppRoutesNames.generalRoutes.otp)) {
      final extra = state.extra as String?;
      if (extra?.isEmpty ?? true) {
        return AppRoutesPaths.routeFullPathByName(
            AppRoutesNames.generalRoutes.login);
      }
      return AppRoutesPaths.routeFullPathByName(
          AppRoutesNames.generalRoutes.otp);
    }
    return null;
  }

  static bool _shouldCheckForLogin(BuildContext context, GoRouterState state) {
    final path = state.fullPath;
    if (path == null) return false;
    if (path ==
            AppRoutesPaths.routeFullPathByName(
                AppRoutesNames.generalRoutes.otp) ||
        path ==
            AppRoutesPaths.routeFullPathByName(
                AppRoutesNames.generalRoutes.login) ||
        path ==
            AppRoutesPaths.routeFullPathByName(
                AppRoutesNames.generalRoutes.splashScreen) ||
        path ==
            AppRoutesPaths.routeFullPathByName(
                AppRoutesNames.generalRoutes.updateApp)) {
      return false;
    }

    return true;
  }

  static Future<String?> _checkForLogin(
      BuildContext context, GoRouterState state) async {
    final tokenState = await _validateToken(context);
    if (!tokenState) {
      _clearToken();
      return AppRoutesPaths.routeFullPathByName(
          AppRoutesNames.generalRoutes.login);
    }

    UserModel? user = await _getUser(context);

    if (user == null) {
      return AppRoutesPaths.routeFullPathByName(
          AppRoutesNames.generalRoutes.login);
    }

    if (user.isActive == '0') {
      return AppRoutesPaths.routeFullPathByName(
          AppRoutesNames.generalRoutes.notAllowed);
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
