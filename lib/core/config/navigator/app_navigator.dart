import 'package:crm_smart/core/config/navigator/routes/finance_routes.dart';
import 'package:crm_smart/core/services/firebase_analytics_services.dart';
import 'package:crm_smart/features/notifications/presentation/pages/notifications_page.dart';
import 'package:crm_smart/features/versions/presentation/pages/incomming_versions_page.dart';
import 'package:crm_smart/features/versions/presentation/pages/version_demand_page.dart';
import 'package:crm_smart/features/versions/presentation/pages/versions_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../../features/app/presentation/pages/not_allowed_page.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/app/presentation/pages/update_app_page.dart';
import '../../../features/auth/login/presentation/pages/login/login_page.dart';
import '../../../features/auth/login/presentation/pages/otp/verify_otp_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/task_management/presentation/pages/ueser_report.dart';
import '../../../features/versions/presentation/widgets/add_new_entry_version_page.dart';
import '../../../model/versionModel.dart';
import '../../common/helpers/selected_sections_handler.dart';
import '../../common/lists/sections_lists.dart';
import '../../common/widgets/not_found_page.dart';
import 'app_navigator_observer.dart';
import 'app_routes_names.dart';
import 'app_routes_paths.dart';
import 'routes/app_redirections.dart';
import 'routes/care_routes.dart';
import 'routes/management_routes.dart';
import 'routes/sales_routes.dart';
import 'routes/support_routes.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static DateTime? date;
  static String? lastPage;

  static Future<dynamic> go(
    Widget page, {
    String? name,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
    bool isNew = true,
  }) {
    if (lastPage != null)
      AnalyticsService().logCustomEvent(name: lastPage ?? "", parameters: {
        if (date != null) 'duration': DateTime.now().difference(date!).toString(),
      });
    lastPage = name?.split('/').last ?? page.toString();
    date = DateTime.now();
    // AnalyticsService.firebaseAnalytics.logEvent(
    //   name: 'screen_view_duration',
    //   parameters: {
    //     'screen_name': name?.split('/').last ?? page.toString(),
    //     'duration_seconds': DateTime.now().second,
    //     'user_id': AppConstants.currentUser.idUser.toString()
    //   },
    // );
    if (kIsWeb && isNew) {
      SelectedSectionsHandler.handle(name: name?.split('/').last ?? page.toString(), pathParameters: pathParameters);
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

  static void printAllRouteNames() {
    for (final route in AppRouter.goRouter.configuration.routes) {
      _printRouteNames(route);
    }
  }

  static void _printRouteNames(RouteBase route) {
    if (route is GoRoute) {
      print('Route name: ${route.name}');
      for (final subRoute in route.routes) {
        _printRouteNames(subRoute);
      }
    } else if (route is ShellRoute) {
      for (final subRoute in route.routes) {
        _printRouteNames(subRoute);
      }
    }
  }

  static Future<dynamic> goReplacement(
    Widget page, {
    String? name,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
    bool isNew = true,
  }) {
    if (lastPage != null)
      AnalyticsService().logCustomEvent(name: lastPage ?? "", parameters: {
        if (date != null) 'duration': DateTime.now().difference(date!).toString(),
      });
    lastPage = name?.split('/').last ?? page.toString();
    date = DateTime.now();

    if (kIsWeb && isNew) {
      AppRouter.goRouter.replaceNamed(
        name?.split('/').last ?? page.toString(),
        extra: extra,
        queryParameters: queryParameters ?? {},
        pathParameters: pathParameters ?? {},
      );
      return Future.value();
    }
    return navigatorKey.currentState!.pushReplacement(
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future<dynamic> push(
    Widget page, {
    String? name,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    if (lastPage != null)
      AnalyticsService().logCustomEvent(name: lastPage ?? "", parameters: {
        if (date != null) 'duration': DateTime.now().difference(date!).toString(),
      });
    lastPage = name?.split('/').last ?? page.toString();
    date = DateTime.now();

    if (kIsWeb) {
      AppRouter.goRouter.pushNamed(
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
    if (lastPage != null)
      AnalyticsService().logCustomEvent(name: lastPage ?? "", parameters: {
        if (date != null) 'duration': DateTime.now().difference(date!).toString(),
      });
    lastPage = page.toString();
    date = DateTime.now();
    return navigatorKey.currentState!.pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }

  // add predicate
  static Future<dynamic> pushAndRemoveUntil(Widget page, [bool Function(Route<dynamic>)? predicate]) {
    if (lastPage != null)
      AnalyticsService().logCustomEvent(name: lastPage ?? "", parameters: {
        if (date != null) 'duration': DateTime.now().difference(date!).toString(),
      });
    lastPage = page.toString();
    date = DateTime.now();
    return navigatorKey.currentState!.pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => page),
      predicate ?? (route) => false,
    );
  }
}

abstract class AppRouter {
  static final GoRouter goRouter = GoRouter(
    navigatorKey: AppNavigator.navigatorKey,
    observers: [
      AppNavigatorObserver(),
    ],
    initialLocation: AppRoutesPaths.init.splashScreen,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => NotFoundPage(),
    routes: [
      GoRoute(
        name: AppRoutesNames.generalRoutes.splashScreen,
        path: AppRoutesPaths.init.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: AppRoutesNames.generalRoutes.updateApp,
        path: AppRoutesPaths.init.updateApp,
        builder: (context, state) => UpdateAppPage(),
      ),
      GoRoute(
        name: AppRoutesNames.generalRoutes.login,
        path: AppRoutesPaths.auth.login,
        builder: (context, state) => LoginPage(),
        routes: [
          GoRoute(
            name: AppRoutesNames.generalRoutes.otp,
            path: AppRoutesPaths.auth.otp,
            builder: (context, state) => VerifyOtpPage(),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesNames.generalRoutes.notAllowed,
        path: AppRoutesPaths.notAllowed,
        builder: (context, state) => NotAllowedPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return HomePage(child: child); // Sidebar persists here
        },
        routes: [
          SalesRoutes.allRoutes(),
          SupportRoutes.allRoutes(),
          CareRoutes.allRoutes(),
          ManagementRoutes.allRoutes(),
          FinanceRoutes.allRoutes(),
          for (final section in SectionsLists.homeSections)
            if (section.path == AppRoutesPaths.homeSections.taskManagement)
              GoRoute(
                name: section.path.split('/').last,
                path: section.path,
                builder: (context, state) => section.page,
                routes: [
                  GoRoute(
                    path: (AppRoutesPaths.homeSections.taskManagement + 'reports').split('/').last,
                    name: AppRoutesPaths.homeSections.taskManagement + 'reports',
                    builder: (context, state) => TaskUsersReportsPage(),
                  ),
                  ...List.generate(
                    section.subSections.length,
                    (index) {
                      final subSection = section.subSections[index];
                      return GoRoute(
                        name: subSection.path.split('/').last,
                        path: subSection.path,
                        builder: (context, state) => subSection.page,
                      );
                    },
                  )
                ],
              ),
        ],
      ),
      GoRoute(
          name: AppRoutesNames.generalRoutes.home,
          path: AppRoutesPaths.home,
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              name: AppRoutesNames.generalRoutes.notifications,
              path: AppRoutesPaths.notifications,
              builder: (context, state) => NotificationsPage(),
            ),
            GoRoute(
                name: AppRoutesNames.generalRoutes.versions,
                path: AppRoutesPaths.versions,
                builder: (context, state) => VersionsPage(),
                routes: [
                  GoRoute(
                    name: AppRoutesNames.generalRoutes.addVersions,
                    path: AppRoutesPaths.addVersions,
                    builder: (context, state) => AddVersionPage(
                      versionModel: state.extra as VersionModel?,
                    ),
                  ),
                  GoRoute(
                      name: AppRoutesNames.generalRoutes.showIncommingUpdate,
                      path: AppRoutesPaths.incommingUpdate,
                      builder: (context, state) => IncommingVersionsPage()),
                  GoRoute(
                      name: AppRoutesNames.generalRoutes.versionOrder,
                      path: AppRoutesPaths.versionOrder,
                      builder: (context, state) => VersionOrderPage()),
                ]),
          ]),

      // GoRoute(
      //   name: AppRoutesNames.generalRoutes.home,
      //   path: AppRoutesPaths.home,
      //   builder: (context, state) => HomePage(),
      //   routes: [
      //     SalesRoutes.allRoutes(),
      //     SupportRoutes.allRoutes(),
      //     CareRoutes.allRoutes(),
      //     ManagementRoutes.allRoutes(),
      //     for (final section in SectionsLists.homeSections)
      //       if (section.path == AppRoutesPaths.homeSections.taskManagement)
      //         GoRoute(
      //           name: section.path.split('/').last,
      //           path: section.path,
      //           builder: (context, state) => section.page,
      //           routes: List.generate(
      //             section.subSections.length,
      //             (index) {
      //               final subSection = section.subSections[index];
      //               return GoRoute(
      //                 name: subSection.path.split('/').last,
      //                 path: subSection.path,
      //                 builder: (context, state) => subSection.page,
      //               );
      //             },
      //           ),
      //         ),
      //   ],
      // ),
    ],
    redirect: (context, state) {
      return AppRedirections.handleRedirection(context, state);
    },
  );
}
