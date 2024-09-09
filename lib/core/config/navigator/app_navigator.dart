import 'package:crm_smart/core/common/lists/sections_lists.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/features/home/presentation/pages/sales_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../../features/app/presentation/pages/not_allowed_page.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/app/presentation/pages/update_app_page.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../features/auth/login/presentation/pages/verify_otp_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../ui/screen/client/client_profile.dart';
import '../../common/widgets/not_found_page.dart';
import 'app_navigator_observer.dart';
import 'app_redirections.dart';
import 'app_routes_paths.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> push(
    Widget page, {
    String? name,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    if (kIsWeb) {
      AppRouter.goRouter.goNamed(
        name?.split('/').last ?? page.toString(),
        extra: extra,
        queryParameters: queryParameters ?? {},
        pathParameters: pathParameters ?? {},
      );
      return Future.value();
    }
    return navigatorKey.currentState!.push(
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  // back with parameter
  static void pop({dynamic result}) {
    if (kIsWeb) {
      AppRouter.goRouter.pop(result);
      return;
    }

    return navigatorKey.currentState!.pop(result);
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
}

abstract class AppRouter {
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
            builder: (context, state) => VerifyOtpPage(
              email: state.extra as String?,
            ),
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
        routes: [
          _salesSection(),
          for (final section in SectionsLists.homeSections)
            if (section.path != AppRoutesPaths.homeSections.sales)
              GoRoute(
                name: section.path.split('/').last,
                path: section.path,
                builder: (context, state) => section.page,
                routes: List.generate(
                  section.subSections.length,
                  (index) {
                    final subSection = section.subSections[index];
                    return GoRoute(
                      name: subSection.path.split('/').last,
                      path: subSection.path,
                      builder: (context, state) => subSection.page,
                    );
                  },
                ),
              ),
        ],
      ),
    ],
    redirect: (context, state) =>
        AppRedirections.handleRedirection(context, state),
  );

  static GoRoute _salesSection() {
    return GoRoute(
      name: AppRoutesPaths.homeSections.sales,
      path: AppRoutesPaths.homeSections.sales,
      builder: (context, state) => SalesSection(),
      routes: [
        ...List.generate(
          SectionsLists.salesSections.length,
          (index) => GoRoute(
            name: SectionsLists.salesSections[index].path.split('/').last,
            path: SectionsLists.salesSections[index].path,
            builder: (context, state) =>
                SectionsLists.salesSections[index].page,
            routes: [
              ...List.generate(
                SectionsLists.salesSections[index].subSections.length,
                (subIdx) {
                  final subSection =
                      SectionsLists.salesSections[index].subSections[subIdx];
                  return GoRoute(
                    name: subSection.path.split('/').last,
                    path: subSection.path,
                    builder: (context, state) => subSection.page,
                    routes: [
                      if (subSection.path.endsWith(AppRoutesPaths
                          .salesClientsSubSections.clientsList)) ...[
                        GoRoute(
                          name: AppRoutesNames
                              .clientProfileInClientsSubSections.toList[subIdx],
                          path: AppRoutesPaths.client.clientProfile,
                          builder: (context, state) {
                            return ClientProfile(
                                idClient: state.pathParameters['idClient']);
                          },
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
