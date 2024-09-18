import 'package:crm_smart/core/config/navigator/routes/routes_helper.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_actions_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/home/presentation/pages/sales_section.dart';
import '../../../../features/sales/clients/clients_debts/presentation/pages/clients_debts_page.dart';
import '../../../../features/sales/clients/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../../../features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../../features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../../../features/sales/deleted_invoices/presentation/pages/deleted_invoice_details_page.dart';
import '../../../../features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import '../../../../features/sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';
import '../../../../features/sales/invoices_list/presentation/pages/clients_invoices_page.dart';
import '../../../../features/sales/manage_withdrawn_invoices/presentation/pages/manage_withdrawn_invoices_page.dart';
import '../../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../features/sales/public_relations/links/presentation/pages/important_links_page.dart';
import '../../../../features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import '../../../../features/sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import '../../../../features/sales/reports/clients_status_reports/presentation/pages/clients_status_reports_page.dart';
import '../../../../features/sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../../features/sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import '../../../../features/sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';
import '../../../../features/sales/withdrawn_invoices/presentation/pages/withdrawn_invoices_page.dart';
import '../../../../ui/screen/barnch_race/pages/branch_race_view.dart';
import '../../../../ui/screen/client/calender_client.dart';
import '../../../../ui/screen/config/company_view.dart';
import '../../../../ui/screen/employee_race/pages/employee_race_page.dart';
import '../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../ui/screen/user/demo_users_page.dart';
import '../../../common/lists/sales_sub_sections_lists.dart';
import '../../../common/widgets/sections_and_subsections/sub_sections_list_view.dart';
import '../app_routes_names.dart';
import '../app_routes_paths.dart';
import 'shared_routes.dart';

abstract class SalesRoutes {
  static GoRoute allRoutes() {
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
          SharedRoutes.clientProfileRoute(
            AppRoutesNames.clientProfile.inClientsList,
            routes: [
              GoRoute(
                name: AppRoutesNames.salesInternalRoutes.invoiceDetails,
                path: AppRoutesPaths.salesInternalRoutes.invoiceDetails,
                builder: (context, state) {
                  final extra = state.extra as Map?;
                  return InvoiceView(
                    invoiceId: state.pathParameters['invoiceId']!,
                    invoice: RoutesHelper.nullableExtra(extra, 'invoice'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.latestClientsUpdates
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.latestClientsUpdates,
        builder: (context, state) => LatestClientsUpdatesPage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inLatestClientsUpdates),
        ],
      ),
      GoRoute(
        name:
            AppRoutesPaths.salesClientsSubSections.clientsDebts.split('/').last,
        path: AppRoutesPaths.salesClientsSubSections.clientsDebts,
        builder: (context, state) => ClientsDebtsPage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inClientsDebts),
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
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inClientsTransferApprovals),
        ],
      ),
      GoRoute(
          name: AppRoutesPaths.salesClientsSubSections.pendingInvoices
              .split('/')
              .last,
          path: AppRoutesPaths.salesClientsSubSections.pendingInvoices,
          builder: (context, state) => PendingInvoicesPage(),
          routes: [
            SharedRoutes.clientDashboardRoute(
                AppRoutesNames.clientDashboard.inPendingInvoices),
          ]),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.financePending
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.financePending,
        builder: (context, state) => FinancePendingPage(),
        routes: [
          SharedRoutes.clientDashboardRoute(
              AppRoutesNames.clientDashboard.inFinancePending),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesClientsSubSections.exceededClients
            .split('/')
            .last,
        path: AppRoutesPaths.salesClientsSubSections.exceededClients,
        builder: (context, state) => ExceededClientsPage(),
        routes: [
          SharedRoutes.clientProfileRoute(
              AppRoutesNames.clientProfile.inExceededClients),
        ],
      ),
    ];
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
        routes: [
          GoRoute(
            name: AppRoutesNames.invoices.deletedInvoiceDetailsPage,
            path: AppRoutesPaths.salesInvoiceSubSections.deletedInvoices,
            builder: (context, state) {
              return DeletedInvoiceDetailsPage(
                invoice: (state.extra as Map)['invoice'],
              );
            },
            routes: [],
          ),
        ],
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
        routes: [
          SharedRoutes.participateProfileRoute(
              AppRoutesNames.participateProfile.inParticipateList),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.salesRelationSubSections.agentsAndDistributors
            .split('/')
            .last,
        path: AppRoutesPaths.salesRelationSubSections.agentsAndDistributors,
        builder: (context, state) => AgentsAndDistributorsPage(),
        routes: [
          SharedRoutes.agentProfileRoute(
            AppRoutesNames.agentProfile.inAgentsAndDistributors,
          ),
          GoRoute(
            name: AppRoutesNames.salesInternalRoutes.addAgent,
            path: AppRoutesPaths.salesInternalRoutes.addAgent,
            builder: (context, state) => AgentDistributorsActionsPage(),
          ),
          GoRoute(
            name: AppRoutesNames.salesInternalRoutes.editAgent,
            path: AppRoutesPaths.salesInternalRoutes.editAgent,
            builder: (context, state) {
              final Map<String, dynamic> extra =
                  state.extra as Map<String, dynamic>;
              return AgentDistributorsActionsPage(
                agent: extra['agent'],
              );
            },
          ),
        ],
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
        builder: (context, state) => DemoUsersPage(),
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
}
