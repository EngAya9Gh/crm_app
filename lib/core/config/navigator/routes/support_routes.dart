import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/common/regions/presentation/manager/regions_cubit.dart';
import '../../../../features/support/clients_install_reports/presentation/pages/clients_install_reports_page.dart';
import '../../../../features/support/dates_table/presentation/pages/dates_table_page.dart';
import '../../../../features/support/delay_after_install/presentation/pages/delay_after_install_report_page.dart';
import '../../../../features/support/delay_install_reports/presentation/pages/delay_install_reports_page.dart';
import '../../../../features/support/support_accept_clients/presentation/pages/support_clients_accept_page.dart';
import '../../../../features/support/support_clients_invoices/presentation/pages/support_clients_invoices_page.dart';
import '../../../../features/support/waiting_agents/presentation/pages/waiting_agents_page.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../common/lists/all_sub_sections_lists.dart';
import '../../../common/widgets/sections_and_subsections/sub_sections_list_view.dart';
import '../app_routes_names.dart';
import '../app_routes_paths.dart';
import 'shared_routes.dart';

abstract class SupportRoutes {
  static GoRoute allRoutes() {
    return GoRoute(
      name: AppRoutesPaths.homeSections.support,
      path: AppRoutesPaths.homeSections.support,
      builder: (context, state) => SubSectionsListView(
        title: 'الدعم الفني',
        subSections: AllSubSectionsLists.supportSubSections,
        onInit: (context) async {
          await Future.wait([
            context.read<RegionsCubit>().getRegions(),
            context.read<MainCityProvider>().getmaincity(),
          ]);
        },
      ),
      routes: _supportSubSections(),
    );
  }

  static List<RouteBase> _supportSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.supportSubSections.supportClientsAccept
            .split('/')
            .last,
        path: AppRoutesPaths.supportSubSections.supportClientsAccept,
        builder: (context, state) => SupportClientsAcceptPage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inSupportAcceptClients),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.supportSubSections.supportClientsInvoices
            .split('/')
            .last,
        path: AppRoutesPaths.supportSubSections.supportClientsInvoices,
        builder: (context, state) => SupportClientsInvoicesPage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inSupportClientsInvoices),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.supportSubSections.datesTable.split('/').last,
        path: AppRoutesPaths.supportSubSections.datesTable,
        builder: (context, state) => DatesTablePage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inDatesTable),
          SharedRoutes.agentProfileRoute(
              AppRoutesNames.agentProfile.inDatesTable),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.supportSubSections.clientsInstallReports
            .split('/')
            .last,
        path: AppRoutesPaths.supportSubSections.clientsInstallReports,
        builder: (context, state) => ClientsInstallReportsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.supportSubSections.delayInstallReports
            .split('/')
            .last,
        path: AppRoutesPaths.supportSubSections.delayInstallReports,
        builder: (context, state) => DelayInstallReportsPage(),
      ),
      GoRoute(
        name:
            AppRoutesPaths.supportSubSections.delayAfterInstall.split('/').last,
        path: AppRoutesPaths.supportSubSections.delayAfterInstall,
        builder: (context, state) => DelayAfterInstallReportPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.supportSubSections.waitingAgents.split('/').last,
        path: AppRoutesPaths.supportSubSections.waitingAgents,
        builder: (context, state) => WaitingAgentsPage(),
        routes: [
          SharedRoutes.agentProfileRoute(
              AppRoutesNames.agentProfile.inWaitingAgents),
        ],
      ),
    ];
  }
}
