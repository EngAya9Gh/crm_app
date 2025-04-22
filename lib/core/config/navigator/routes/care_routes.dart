import 'package:crm_smart/features/clients_care/recommended_client/presentation/manager/recommended_client_bloc.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/presentation/pages/violations_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/clients_care/accept_clients/presentation/pages/clients_accept_page.dart';
import '../../../../features/clients_care/client_communications/presentation/pages/care_activities_page.dart';
import '../../../../features/clients_care/clients_care_reports/presentation/pages/clients_care_reports_page.dart';
import '../../../../features/clients_care/clients_not_using_system/presentation/pages/not_using_system_page.dart';
import '../../../../features/clients_care/clients_tickets/presentation/pages/add_ticket_page.dart';
import '../../../../features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import '../../../../features/clients_care/clients_wrong_numbers/presentation/pages/wrong_numbers_page.dart';
import '../../../../features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import '../../../../features/clients_care/evaluation_across_system/presentation/pages/elevation_sys_support_page.dart';
import '../../../../features/clients_care/evaluation_level_report/presentation/pages/evaluation_level_report_page.dart';
import '../../../../features/clients_care/greeting_communication/presentation/pages/greeting_communication_page.dart';
import '../../../../features/clients_care/install_quality/presentation/pages/install_quality_page.dart';
import '../../../../features/clients_care/periodic_communication/presentation/pages/periodic_communication_page.dart';
import '../../../../features/clients_care/periodic_communication_reports/presentation/pages/periodic_communication_reports_page.dart';
import '../../../../features/clients_care/previous_ratings/presentation/pages/previous_ratings_page.dart';
import '../../../../features/clients_care/recommended_client/presentation/pages/recommended_clients_reports_page.dart';
import '../../../../features/clients_care/special_clients/presentation/pages/special_clients_page.dart';
import '../../../common/lists/all_sub_sections_lists.dart';
import '../../../common/widgets/sections_and_subsections/sub_sections_list_view.dart';
import '../app_routes_names.dart';
import '../app_routes_paths.dart';
import 'shared_routes.dart';

abstract class CareRoutes {
  static GoRoute allRoutes() {
    return GoRoute(
      name: AppRoutesPaths.homeSections.care,
      path: AppRoutesPaths.homeSections.care,
      builder: (context, state) => SubSectionsListView(
        title: 'العناية بالعملاء',
        subSections: AllSubSectionsLists.careSubSections,
      ),
      routes: _careSubSections(),
    );
  }

  static List<RouteBase> _careSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.careSubSections.reports.split('/').last,
        path: AppRoutesPaths.careSubSections.reports,
        builder: (context, state) => SubSectionsListView(
          title: 'التقارير',
          subSections: AllSubSectionsLists.careReports,
        ),
        routes: [
          GoRoute(
            name: AppRoutesPaths.careSubSections.previousRatings.split('/').last,
            path: AppRoutesPaths.careSubSections.previousRatings,
            builder: (context, state) => PreviousRatingsPage(),
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.clientsCareReports.split('/').last,
            path: AppRoutesPaths.careSubSections.clientsCareReports,
            builder: (context, state) => ClientsCareReportsPage(),
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.clientsRecommendedReports.split('/').last,
            path: AppRoutesPaths.careSubSections.clientsRecommendedReports,
            builder: (context, state) => RecommendedClientsReportPage(),
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.evaluationLevelReport.split('/').last,
            path: AppRoutesPaths.careSubSections.evaluationLevelReport,
            builder: (context, state) => EvaluationLevelReportPage(),
            routes: [
              SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareEvaluationLevelReport),
            ],
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.periodicCommunicationReports.split('/').last,
            path: AppRoutesPaths.careSubSections.periodicCommunicationReports,
            builder: (context, state) => PeriodicCommunicationReportsPage(),
            routes: [
              SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCarePeriodicCommunicationReports),
            ],
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.notUsingSystem.split('/').last,
            path: AppRoutesPaths.careSubSections.notUsingSystem,
            builder: (context, state) => NotUsingSystemPage(),
            routes: [
              SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareNotUsingSystem),
            ],
          ),
          GoRoute(
            name: AppRoutesPaths.careSubSections.wrongNumbers.split('/').last,
            path: AppRoutesPaths.careSubSections.wrongNumbers,
            builder: (context, state) => WrongNumbersPage(),
            routes: [
              SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareWrongNumbers),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.clientsAccept.split('/').last,
        path: AppRoutesPaths.careSubSections.clientsAccept,
        builder: (context, state) => ClientsAcceptPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareAcceptClients),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.specialClients.split('/').last,
        path: AppRoutesPaths.careSubSections.specialClients,
        builder: (context, state) => SpecialClientsPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareSpecialClients),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.greetingCommunication.split('/').last,
        path: AppRoutesPaths.careSubSections.greetingCommunication,
        builder: (context, state) => GreetingCommunicationPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareGreetingCommunication),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.installQuality.split('/').last,
        path: AppRoutesPaths.careSubSections.installQuality,
        builder: (context, state) => InstallQualityPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareInstallQuality),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.periodicCommunication.split('/').last,
        path: AppRoutesPaths.careSubSections.periodicCommunication,
        builder: (context, state) => PeriodicCommunicationPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCarePeriodicCommunication),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.sysSupportRating.split('/').last,
        path: AppRoutesPaths.careSubSections.sysSupportRating,
        builder: (context, state) => SysSupportRatingPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.violations.split('/').last,
        path: AppRoutesPaths.careSubSections.violations,
        builder: (context, state) => ViolationsPage(),
        routes: [
          SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inCareViolations),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.tickets.split('/').last,
        path: AppRoutesPaths.careSubSections.tickets,
        builder: (context, state) => TicketsPage(),
        routes: [
          GoRoute(
            name: AppRoutesNames.careInternalRoutes.addTicket,
            path: AppRoutesPaths.careInternalRoutes.addTicket,
            builder: (context, state) => AddTicketPage(),
            routes: [
              SharedRoutes.clientProfileRoute(AppRoutesNames.clientProfile.inAddTicket),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.clientsActivities.split('/').last,
        path: AppRoutesPaths.careSubSections.clientsActivities,
        builder: (context, state) => CareActivitiesPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.careSubSections.crudActivities.split('/').last,
        path: AppRoutesPaths.careSubSections.crudActivities,
        builder: (context, state) => CrudActivitiesPage(),
      ),
    ];
  }
}
