import 'package:crm_smart/core/common/lists/sections_lists.dart';
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
import '../../common/widgets/not_found_page.dart';
import 'app_navigator_observer.dart';
import 'app_redirections.dart';
import 'app_routes_paths.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> push(
    Widget page, {
    String? path,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    if (kIsWeb) {
      // if (path != null) {
      //   AppRouter.goRouter.go(
      //     path,
      //     extra: extra,
      //   );
      //   return Future.value();
      // }
      AppRouter.goRouter.goNamed(
        path?.split('/').last ?? page.toString(),
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

//
// class _HomeSections {
//   final String sales = 'sales';
//   final String support = 'support';
//   final String care = 'care';
//   final String management = 'management';
//   final String taskManagement = 'taskManagement';
// }
//
// class _SalesSections {
//   final String clients = 'clients';
//   final String invoices = 'invoices';
//   final String relations = 'relations';
//   final String reports = 'reports';
//   final String races = 'races';
// }
//
// class _SupportSubSections {
//   final String clientsAccept = 'clients_accept';
//   final String clientsInvoices = 'clients_invoices';
//   final String datesTable = 'dates_table';
//   final String clientsInstallReports = 'install_reports';
//   final String delayInstallReports = 'delay_install_reports';
//   final String delayAfterInstall = 'delay_after_install';
//   final String waitingAgents = 'waiting_agents';
// }
//
// class _CareSubSections {
//   final String clientsAccept = 'clients_accept';
//   final String specialClients = 'special_clients';
//   final String greetingCommunication = 'greeting_communication';
//   final String installQuality = 'install_quality';
//   final String periodicCommunication = 'periodic_communication';
//   final String previousRatings = 'previous_ratings';
//   final String tickets = 'tickets';
//   final String clientsCareReports = 'clients_care_reports';
//   final String evaluationLevelReport = 'evaluation_level_report';
//   final String periodicCommunicationReports = 'periodic_communication_reports';
//   final String notUsingSystem = 'not_using_system';
//   final String wrongNumbers = 'wrong_numbers';
// }
//
// class _ManagementSubSections {
//   final String manageUsers = 'manage_users';
//   final String managePrivileges = 'levels';
//   final String manageWithdrawals = 'manage_withdrawals';
//   final String manageRejectReasons = 'manage_reject_reasons';
//   final String products = 'products';
//   final String changeCountry = 'change_country';
//   final String regions = 'regions';
//   final String departments = 'departments';
//   final String withdrawalReasons = 'withdrawal_reasons';
//   final String regionsAndCities = 'regions_and_cities';
//   final String ticketTypes = 'ticket_types';
//   final String activityTypes = 'activity_types';
//   final String branchRace = 'branch-race';
//   final String advancedConfigs = 'advanced_configs';
//   final String generalConfigs = 'general_configs';
// }
//
// class _SalesClientsSubSections {
//   final String clientsList = 'clients-list';
//   final String latestClientsUpdates = 'latest-clients-updates';
//   final String clientsDebts = 'clients-debts';
//   final String calenderClient = 'calender-client';
//   final String clientsTransferApprovals = 'clients-transfer-approvals';
//   final String pendingInvoices = 'pending-invoices';
//   final String financePending = 'finance-pending';
//   final String exceededClients = 'exceeded-clients';
// }
//
// class _SalesInvoiceSubSections {
//   final String clientsInvoices = 'clients-invoices';
//   final String deletedInvoices = 'deleted-invoices';
//   final String manageWithdrawnInvoices = 'manage-withdrawn-invoices';
//   final String withdrawnInvoices = 'withdrawn-invoices';
// }
//
// class _SalesRelationSubSections {
//   final String participateList = 'participate-list';
//   final String agentsAndDistributors = 'agents-and-distributors';
//   final String companyView = 'company-view';
//   final String importantLinks = 'important-links';
//   final String usertestView = 'usertest-view';
// }
//
// class _SalesReportsSubSections {
//   final String employeesSalesReports = 'employees-sales-reports';
//   final String regionsSalesReports = 'regions-sales-reports';
//   final String productsSalesReports = 'products-sales-reports';
//   final String clientsDebtsReports = 'clients-debts-reports';
//   final String clientsStatusReports = 'clients-status-reports';
// }
//
// class _SalesRaceSubSections {
//   final String employeeRace = 'employee-race';
//   final String branchRace = 'branch-race';
// }

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
