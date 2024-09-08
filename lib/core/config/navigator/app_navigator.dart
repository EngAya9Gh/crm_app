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
  static go(String path, {Map<String, String>? query}) {
    return goRouter.goNamed(
      path,
      extra: query,
    );
  }

  static push(String path, {Map<String, String>? query}) {
    return goRouter.pushNamed(
      path,
      extra: query,
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
        routes: [
          GoRoute(
            name: VerifyOtpPage().toString(),
            path: AppRoutesPaths.auth.otp,
            builder: (context, state) => VerifyOtpPage(),
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
