// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smart_crm_app/features/app/presentation/pages/splash_page.dart';
// import 'package:smart_crm_app/features/auth/presentation/pages/login_page.dart';
// import 'package:smart_crm_app/features/auth/presentation/pages/otp_page.dart';
// import 'package:smart_crm_app/features/clients_care/presentation/pages/clients_care_main_page.dart';
// import 'package:smart_crm_app/features/marketing/presentation/pages/marketing_main_page.dart';
// import 'package:smart_crm_app/features/sales/presentation/pages/action_client_page.dart';
// import 'package:smart_crm_app/features/sales/presentation/pages/list_clients_page.dart';
// import 'package:smart_crm_app/features/sales/presentation/pages/sales_main_page.dart';
// import 'package:smart_crm_app/features/support/presentation/pages/support_main_page.dart';
// import '../../../features/app/presentation/pages/base_page.dart';
// import '../../../features/app/presentation/pages/invoice/action_invoice_page.dart';
// import '../../../features/app/presentation/pages/client_profile/client_profile_page.dart';
// import '../../../features/app/presentation/pages/error_page.dart';
// import '../../../features/sales/presentation/pages/clients_invoices_page.dart';
// import 'router_config.dart';
//
// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
//
// GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
//
// GlobalKey<NavigatorState> get homeNavigatorKey => _homeNavigatorKey;
//
// class GRouter {
//   static GoRouter get router => _router;
//
//   static RouterConfiguration get config => _config;
//
//   static final RouterConfiguration _config = RouterConfiguration.init();
//
//   static final GoRouter _router = GoRouter(
//     initialLocation: _config.kRootRoute,
//     navigatorKey: _rootNavigatorKey,
//     routes: <RouteBase>[
//       GoRoute(
//         path: _config.kRootRoute,
//         parentNavigatorKey: _rootNavigatorKey,
//         pageBuilder: (BuildContext context, GoRouterState state) {
//           return _builderPage(
//             child: const SplashPage(),
//             state: state,
//           );
//         },
//       ),
//       GoRoute(
//         path: _config.authRoutes.loginPage,
//         name: _config.authRoutes.loginPage,
//         parentNavigatorKey: _rootNavigatorKey,
//         pageBuilder: (BuildContext context, GoRouterState state) {
//           return _builderPage(
//             child: const LoginPage(),
//             state: state,
//           );
//         },
//       ),
//       GoRoute(
//         path: _config.authRoutes.otpPage,
//         name: _config.authRoutes.otpPage,
//         parentNavigatorKey: _rootNavigatorKey,
//         pageBuilder: (BuildContext context, GoRouterState state) {
//           return _builderPage(
//             child: const OtpPage(),
//             state: state,
//           );
//         },
//       ),
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, child) {
//           return BasePage(child: child);
//         },
//         branches: [
//           StatefulShellBranch(
//             initialLocation: _config.mainRoutes.salesPage,
//             routes: [
//               GoRoute(
//                 path: _config.mainRoutes.salesPage,
//                 name: _config.mainRoutes.salesPage,
//                 pageBuilder: (BuildContext context, GoRouterState state) {
//                   return _builderPage(
//                     child: const SalesMainPage(),
//                     state: state,
//                   );
//                 },
//                 routes: [
//                   GoRoute(
//                     path: _config.salesRoutes.listClientsPage,
//                     name: _config.salesRoutes.listClientsPage,
//                     parentNavigatorKey: _rootNavigatorKey,
//                     pageBuilder: (BuildContext context, GoRouterState state) {
//                       return _builderPage(
//                         child: const ListClientsPage(),
//                         state: state,
//                       );
//                     },
//                     routes: [
//                       GoRoute(
//                         path: _config.salesRoutes.actionClientPage,
//                         name: _config.salesRoutes.actionClientPage,
//                         parentNavigatorKey: _rootNavigatorKey,
//                         pageBuilder: (BuildContext context, GoRouterState state) {
//                           return _builderPage(
//                             child: const ActionClientPage(),
//                             state: state,
//                           );
//                         },
//                       ),
//                       GoRoute(
//                         path: _config.salesRoutes.clientProfilePage,
//                         name: _config.salesRoutes.clientProfilePage,
//                         parentNavigatorKey: _rootNavigatorKey,
//                         pageBuilder: (BuildContext context, GoRouterState state) {
//                           return _builderPage(
//                             child: const ClientProfilePage(),
//                             state: state,
//                           );
//                         },
//                         routes: [
//                           GoRoute(
//                             path: _config.salesRoutes.actionInvoicePage,
//                             name: _config.salesRoutes.actionInvoicePage,
//                             parentNavigatorKey: _rootNavigatorKey,
//                             pageBuilder: (BuildContext context, GoRouterState state) {
//                               return _builderPage(
//                                 child: const ActionInvoicePage(),
//                                 state: state,
//                               );
//                             },
//                           ),
//                         ]
//                       ),
//                     ],
//                   ),
//                   GoRoute(
//                     path: _config.salesRoutes.clientsInvoicesPage,
//                     name: _config.salesRoutes.clientsInvoicesPage,
//                     parentNavigatorKey: _rootNavigatorKey,
//                     pageBuilder: (BuildContext context, GoRouterState state) {
//                       return _builderPage(
//                         child: const clientsInvoicesPage(),
//                         state: state,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             initialLocation: _config.mainRoutes.supportPage,
//             routes: [
//               GoRoute(
//                 path: _config.mainRoutes.supportPage,
//                 name: _config.mainRoutes.supportPage,
//                 pageBuilder: (BuildContext context, GoRouterState state) {
//                   return _builderPage(
//                     child: const SupportMainPage(),
//                     state: state,
//                   );
//                 },
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             initialLocation: _config.mainRoutes.clientsCarePage,
//             routes: [
//               GoRoute(
//                 path: _config.mainRoutes.clientsCarePage,
//                 name: _config.mainRoutes.clientsCarePage,
//                 pageBuilder: (BuildContext context, GoRouterState state) {
//                   return _builderPage(
//                     child: const ClientsCareMainPage(),
//                     state: state,
//                   );
//                 },
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             initialLocation: _config.mainRoutes.marketingPage,
//             routes: [
//               GoRoute(
//                 path: _config.mainRoutes.marketingPage,
//                 name: _config.mainRoutes.marketingPage,
//                 pageBuilder: (BuildContext context, GoRouterState state) {
//                   return _builderPage(
//                     child: const MarketingMainPage(),
//                     state: state,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//     errorBuilder: (context, state) => const ErrorPage(),
//   );
//
//   static Page<dynamic> _builderPage<T>({required Widget child, required GoRouterState state}) {
//     // final params = state.pathParameters;
//     // final isUseCustomTransition = jsonDecode(params['customTransition'] ?? "false");
//     //
//     // if (isUseCustomTransition) {
//     //   return CustomTransitionPage(
//     //     key: state.pageKey,
//     //     child: child,
//     //     transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
//     //       position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
//     //       child: child,
//     //     ),
//     //   );
//     // }
//     // if (Platform.isIOS) {
//     return CupertinoPage<T>(child: child, key: state.pageKey);
//     // } else {
//     //   return MaterialPage<T>(child: child, key: state.pageKey);
//     // }
//   }
// }
