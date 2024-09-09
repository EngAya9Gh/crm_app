import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../features/app/presentation/pages/not_allowed_page.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/app/presentation/pages/update_app_page.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../features/auth/login/presentation/pages/verify_otp_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../common/widgets/not_found_page.dart';
import 'app_navigator_observer.dart';
import 'app_redirections.dart';
import 'app_routes_paths.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!
        .push(CupertinoPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushReplacement(Widget page) {
    return navigatorKey.currentState!
        .pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }

  // add predicate
  static Future<dynamic> pushAndRemoveUntil(Widget page,
      [bool Function(Route<dynamic>)? predicate]) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => page),
        (predicate ?? (Route<dynamic> route) => false));
  }

  // back with parameter
  static void pop({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }
}

abstract class AppRouter {
  static final Map<String, String> routeFullPathByName = {
    SplashScreen().toString(): AppRoutesPaths.init.splashScreen,
    UpdateAppPage().toString(): AppRoutesPaths.init.updateApp,
    LoginPage().toString(): AppRoutesPaths.auth.login,
    VerifyOtpPage().toString():
        "${AppRoutesPaths.auth.login}/${AppRoutesPaths.auth.otp}",
    NotAllowedPage().toString(): AppRoutesPaths.notAllowed,
    HomePage().toString(): AppRoutesPaths.home,
  };

  static go(
    String path, {
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    return goRouter.goNamed(
      path,
      extra: extra,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
    );
  }

  static push(
    String path, {
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    return goRouter.pushNamed(
      path,
      extra: extra,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
    );
  }

  static pop({dynamic result}) {
    return goRouter.pop(result);
  }

  static final GoRouter goRouter = GoRouter(
    navigatorKey: AppNavigator.navigatorKey,
    observers: [AppNavigatorObserver()],
    initialLocation: AppRoutesPaths.init.splashScreen,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => NotFoundPage(),
    routes: [
      GoRoute(
        name: SplashScreen().toString(),
        path: AppRoutesPaths.init.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: UpdateAppPage().toString(),
        path: AppRoutesPaths.init.updateApp,
        builder: (context, state) => UpdateAppPage(),
      ),
      GoRoute(
        name: LoginPage().toString(),
        path: AppRoutesPaths.auth.login,
        builder: (context, state) => LoginPage(),
        redirect: (context, state) =>
            AppRedirections.handleLoginRedirection(context, state),
        routes: [
          GoRoute(
            name: VerifyOtpPage().toString(),
            path: AppRoutesPaths.auth.otp,
            builder: (context, state) => VerifyOtpPage(
              email: state.extra as String?,
            ),
            redirect: (context, state) =>
                AppRedirections.handleOtpRedirection(context, state),
          ),
        ],
      ),
      GoRoute(
        name: NotAllowedPage().toString(),
        path: AppRoutesPaths.notAllowed,
        builder: (context, state) => NotAllowedPage(),
      ),
      GoRoute(
        name: HomePage().toString(),
        path: AppRoutesPaths.home,
        builder: (context, state) => HomePage(),
      ),
    ],
    redirect: (context, state) =>
        AppRedirections.handleRedirection(context, state),
  );
}
