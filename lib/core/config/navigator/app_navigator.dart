import 'package:crm_smart/core/common/lists/sections_lists.dart';
import 'package:crm_smart/features/home/presentation/pages/sales_section.dart';
import 'package:crm_smart/features/sales/clients/client_dashboard.dart';
import 'package:crm_smart/features/sales/clients/clients_debts/presentation/pages/clients_debts_page.dart';
import 'package:crm_smart/features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../../features/app/presentation/pages/not_allowed_page.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/app/presentation/pages/update_app_page.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../features/auth/login/presentation/pages/verify_otp_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/sales/clients/clients_list/presentation/pages/clients_list_page.dart';
import '../../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../../features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import '../../../features/sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';
import '../../../features/sales/invoices_list/presentation/pages/clients_invoices_page.dart';
import '../../../features/sales/manage_withdrawn_invoices/presentation/pages/manage_withdrawn_invoices_page.dart';
import '../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../features/sales/public_relations/links/presentation/pages/important_links_page.dart';
import '../../../features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import '../../../features/sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import '../../../features/sales/reports/clients_status_reports/presentation/pages/clients_status_reports_page.dart';
import '../../../features/sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../features/sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import '../../../features/sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';
import '../../../features/sales/withdrawn_invoices/presentation/pages/withdrawn_invoices_page.dart';
import '../../../ui/screen/barnch_race/pages/branch_race_view.dart';
import '../../../ui/screen/client/calender_client.dart';
import '../../../ui/screen/client/client_profile.dart';
import '../../../ui/screen/config/company_view.dart';
import '../../../ui/screen/employee_race/pages/employee_race_page.dart';
import '../../../ui/screen/user/usertest_view.dart';
import '../../common/lists/sales_sub_sections_lists.dart';
import '../../common/widgets/not_found_page.dart';
import '../../common/widgets/sections_and_subsections/sub_sections_list_view.dart';
import 'app_navigator_observer.dart';
import 'app_redirections.dart';
import 'app_routes_names.dart';
import 'app_routes_paths.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> go(
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

  static Future<dynamic> push(
    Widget page, {
    String? name,
    dynamic extra,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
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
        GoRoute(
          name: AppRoutesPaths.salesSections.clients.split('/').last,
          path: AppRoutesPaths.salesSections.clients,
          builder: (context, state) => SubSectionsListView(
            title: 'العملاء',
            subSections: SalesSubSectionsLists.clientsSubSections,
          ),
          routes: _clientsSubSections(),
        ),
        GoRoute(
          name: AppRoutesPaths.salesSections.invoices.split('/').last,
          path: AppRoutesPaths.salesSections.invoices,
          builder: (context, state) => SubSectionsListView(
            title: 'الفواتير',
            subSections: SalesSubSectionsLists.invoiceSections,
          ),
          routes: _invoiceSubSections(),
        ),
        GoRoute(
          name: AppRoutesPaths.salesSections.relations.split('/').last,
          path: AppRoutesPaths.salesSections.relations,
          builder: (context, state) => SubSectionsListView(
            title: 'العلاقات العامة',
            subSections: SalesSubSectionsLists.relationSections,
          ),
          routes: _relationsSubSections(),
        ),
        GoRoute(
          name: AppRoutesPaths.salesSections.reports.split('/').last,
          path: AppRoutesPaths.salesSections.reports,
          builder: (context, state) => SubSectionsListView(
            title: 'تقارير واحصائيات',
            subSections: SalesSubSectionsLists.reportsSections,
          ),
          routes: _reportsSubSections(),
        ),
        GoRoute(
          name: AppRoutesPaths.salesSections.races.split('/').last,
          path: AppRoutesPaths.salesSections.races,
          builder: (context, state) => SubSectionsListView(
            title: 'السباقات',
            subSections: SalesSubSectionsLists.raceSections,
          ),
          routes: _raceSubSections(),
        ),

        // ...List.generate(
        //   SectionsLists.salesSections.length,
        //   (index) => GoRoute(
        //     name: SectionsLists.salesSections[index].path.split('/').last,
        //     path: SectionsLists.salesSections[index].path,
        //     builder: (context, state) =>
        //         SectionsLists.salesSections[index].page,
        //     routes: [
        //       ...List.generate(
        //         SectionsLists.salesSections[index].subSections.length,
        //         (subIdx) {
        //           final subSection =
        //               SectionsLists.salesSections[index].subSections[subIdx];
        //           return GoRoute(
        //             name: subSection.path.split('/').last,
        //             path: subSection.path,
        //             builder: (context, state) => subSection.page,
        //             routes: [
        //               if (index <
        //                   AppRoutesNames.clientProfileInClientsSubSections
        //                       .allSubsectionsNamesList.length) ...[
        //                 GoRoute(
        //                   name: AppRoutesNames.clientProfileInClientsSubSections
        //                       .allSubsectionsNamesList[index][subIdx],
        //                   // name: AppRoutesNames.clientProfileInClientsSubSections
        //                   //     .clientsSubsectionsNamesList[subIdx],
        //                   path: AppRoutesPaths.client.clientProfile,
        //                   builder: (context, state) {
        //                     return ClientProfile(
        //                         idClient: state.pathParameters['idClient']);
        //                   },
        //                 ),
        //               ],
        //             ],
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  static List<RouteBase> _clientsSubSections() {
    return [
      GoRoute(
        name:
            AppRoutesPaths.salesClientsSubSections.clientsList.split('/').last,
        path: AppRoutesPaths.salesClientsSubSections.clientsList,
        builder: (context, state) => ClientsListPage(),
        routes: [
          _clientProfileRoute(
              AppRoutesNames.clientProfile.clientProfileInClientsList),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.latestClientsUpdates
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.latestClientsUpdates,
        builder: (context, state) => LatestClientsUpdatesPage(),
        routes: [
          _clientProfileRoute(
              AppRoutesNames.clientProfile.clientProfileInLatestClientsUpdates),
        ],
      ),
      GoRoute(
        name:
            AppRoutesPaths.salesClientsSubSections.clientsDebts.split('/').last,
        path: AppRoutesPaths.salesClientsSubSections.clientsDebts,
        builder: (context, state) => ClientsDebtsPage(),
        routes: [
          _clientProfileRoute(
              AppRoutesNames.clientProfile.clientProfileInClientsDebts),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.calenderClient
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.calenderClient,
        builder: (context, state) => calender_client(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.clientsTransferApprovals
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.clientsTransferApprovals,
        builder: (context, state) => ClientsTransferApprovalsPage(),
        routes: [
          _clientProfileRoute(AppRoutesNames
              .clientProfile.clientProfileInClientsTransferApprovals),
        ],
      ),
      GoRoute(
          name: AppRoutesPaths.salesClientsSubSections.pendingInvoices
              .split('/')
              .last,
          path: AppRoutesPaths.salesClientsSubSections.pendingInvoices,
          builder: (context, state) => PendingInvoicesPage(),
          routes: [
            _clientDashboardRoute(AppRoutesNames
                .clientDashboard.clientDashboardInPendingInvoices),
          ]),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.financePending
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.financePending,
        builder: (context, state) => FinancePendingPage(),
        routes: [
          _clientDashboardRoute(
              AppRoutesNames.clientDashboard.clientDashboardInFinancePending),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.exceededClients
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.exceededClients,
        builder: (context, state) => ExceededClientsPage(),
        routes: [
          _clientProfileRoute(
              AppRoutesNames.clientProfile.clientProfileInExceededClients),
        ],
      ),
    ];
  }

  static GoRoute _clientDashboardRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.client.clientDashboard,
      builder: (context, state) {
        final extra = state.extra as Map;
        return ClientDashboard(
          invoiceModel: extra['invoiceModel'],
          typeInvoice: extra['typeInvoice'],
        );
      },
    );
  }

  static List<RouteBase> _invoiceSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.salesInvoiceSubSections.clientsInvoices
            .split('/')
            .last,
        path: AppRoutesPaths.salesInvoiceSubSections.clientsInvoices,
        builder: (context, state) => ClientsInvoicesPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesInvoiceSubSections.deletedInvoices
            .split('/')
            .last,
        path: AppRoutesPaths.salesInvoiceSubSections.deletedInvoices,
        builder: (context, state) => DeletedInvoicesPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesInvoiceSubSections.manageWithdrawnInvoices
            .split('/')
            .last,
        path: AppRoutesPaths.salesInvoiceSubSections.manageWithdrawnInvoices,
        builder: (context, state) => ManageWithdrawnInvoicesPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesInvoiceSubSections.withdrawnInvoices
            .split('/')
            .last,
        path: AppRoutesPaths.salesInvoiceSubSections.withdrawnInvoices,
        builder: (context, state) => WithdrawnInvoicesPage(),
      ),
    ];
  }

  static List<RouteBase> _relationsSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.salesRelationSubSections.participateList
            .split('/')
            .last,
        path: AppRoutesPaths.salesRelationSubSections.participateList,
        builder: (context, state) => ParticipateListPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesRelationSubSections.agentsAndDistributors
            .split('/')
            .last,
        path: AppRoutesPaths.salesRelationSubSections.agentsAndDistributors,
        builder: (context, state) => AgentsAndDistributorsPage(),
      ),
      GoRoute(
        name:
            AppRoutesPaths.salesRelationSubSections.companyView.split('/').last,
        path: AppRoutesPaths.salesRelationSubSections.companyView,
        builder: (context, state) => company_view(type: 'ticket'),
      ),
      GoRoute(
        name: AppRoutesPaths.salesRelationSubSections.importantLinks
            .split('/')
            .last,
        path: AppRoutesPaths.salesRelationSubSections.importantLinks,
        builder: (context, state) => ImportantLinksPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesRelationSubSections.usertestView
            .split('/')
            .last,
        path: AppRoutesPaths.salesRelationSubSections.usertestView,
        builder: (context, state) => usertest_view(),
      ),
    ];
  }

  static List<RouteBase> _reportsSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.salesReportsSubSections.employeesSalesReports
            .split('/')
            .last,
        path: AppRoutesPaths.salesReportsSubSections.employeesSalesReports,
        builder: (context, state) => EmployeesSalesReportsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesReportsSubSections.regionsSalesReports
            .split('/')
            .last,
        path: AppRoutesPaths.salesReportsSubSections.regionsSalesReports,
        builder: (context, state) => RegionsSalesReportsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesReportsSubSections.productsSalesReports
            .split('/')
            .last,
        path: AppRoutesPaths.salesReportsSubSections.productsSalesReports,
        builder: (context, state) => ProductsSalesReportsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesReportsSubSections.clientsDebtsReports
            .split('/')
            .last,
        path: AppRoutesPaths.salesReportsSubSections.clientsDebtsReports,
        builder: (context, state) => ClientsDebtsReportsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.salesReportsSubSections.clientsStatusReports
            .split('/')
            .last,
        path: AppRoutesPaths.salesReportsSubSections.clientsStatusReports,
        builder: (context, state) => ClientsStatusReportsPage(),
      ),
    ];
  }

  static List<RouteBase> _raceSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.salesRaceSubSections.employeeRace.split('/').last,
        path: AppRoutesPaths.salesRaceSubSections.employeeRace,
        builder: (context, state) => EmployeeRacePage(),
      ),
      GoRoute(
        name:
            AppRoutesPaths.salesRaceSubSections.salesBranchRace.split('/').last,
        path: AppRoutesPaths.salesRaceSubSections.salesBranchRace,
        builder: (context, state) => BranchRaceView(),
      ),
    ];
  }

  static GoRoute _clientProfileRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.client.clientProfile,
      builder: (context, state) {
        final extra = state.extra as Map?;
        return ClientProfile(
          idClient: state.pathParameters['idClient'],
          tabIndex:
              extra?.containsKey('tabIndex') == true ? extra!['tabIndex'] : 0,
        );
      },
    );
  }
}
