import 'package:crm_smart/core/common/lists/all_sub_sections_lists.dart';
import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:crm_smart/features/client_care/care_usage_efficiency/presentation/pages/care_usage_page.dart';
import 'package:crm_smart/features/clients_care/client_communications/presentation/pages/care_activities_page.dart';
import 'package:crm_smart/features/clients_care/clients_care_reports/presentation/pages/clients_care_reports_page.dart';
import 'package:crm_smart/features/clients_care/clients_not_using_system/presentation/pages/not_using_system_page.dart';
import 'package:crm_smart/features/clients_care/clients_wrong_numbers/presentation/pages/wrong_numbers_page.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/pages/elevation_sys_support_page.dart';
import 'package:crm_smart/features/clients_care/evaluation_level_report/presentation/pages/evaluation_level_report_page.dart';
import 'package:crm_smart/features/clients_care/periodic_communication_reports/presentation/pages/periodic_communication_reports_page.dart';
import 'package:crm_smart/features/clients_care/previous_ratings/presentation/pages/previous_ratings_page.dart';
import 'package:crm_smart/features/clients_care/recommended_client/presentation/pages/recommended_clients_reports_page.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/presentation/pages/violations_page.dart';
import 'package:crm_smart/features/finance/commission_for_collaborators/presentation/pages/commission_collaborators_page.dart';
import 'package:crm_smart/features/finance/verified_client/presentation/pages/verified_clients_page.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/pages/mob_verified_invoices_page.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/pages/web_verified_invoices_page.dart';
import 'package:crm_smart/features/mangement/advanced_configs/presentation/pages/advanced_cofigs_page.dart';
import 'package:crm_smart/features/mangement/general_configs/presentation/pages/general_cofigs_page.dart';
import 'package:crm_smart/features/mangement/manage_privileges/levels/presentation/pages/levels_page.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/pages/manage_reject_reasons_page.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/pages/manage_withdrawals_page.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/presentation/pages/clients_contacts_pages/clients_contact_page.dart';
import 'package:crm_smart/features/sales/clients/clients_debts/presentation/pages/clients_debts_page.dart';
import 'package:crm_smart/features/sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';
import 'package:crm_smart/features/sales/manage_withdrawn_invoices/presentation/pages/manage_withdrawn_invoices_page.dart';
import 'package:crm_smart/features/sales/public_relations/links/presentation/pages/important_links_page.dart';
import 'package:crm_smart/features/sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import 'package:crm_smart/features/sales/reports/clients_status_reports/presentation/pages/clients_status_reports_page.dart';
import 'package:crm_smart/features/sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import 'package:crm_smart/features/sales/withdrawn_invoices/presentation/pages/withdrawn_invoices_page.dart';
import 'package:crm_smart/features/support/clients_install_reports/presentation/pages/clients_install_reports_page.dart';
import 'package:crm_smart/features/support/dates_table/presentation/pages/dates_table_page.dart';
import 'package:crm_smart/features/support/dates_timeline/presentation/pages/dates_timeline_page.dart';
import 'package:crm_smart/features/support/delay_after_install/presentation/pages/delay_after_install_report_page.dart';
import 'package:crm_smart/features/support/delay_install_reports/presentation/pages/delay_install_reports_page.dart';
import 'package:crm_smart/features/support/support_accept_clients/presentation/pages/support_clients_accept_page.dart';
import 'package:crm_smart/features/support/support_clients_invoices/presentation/pages/support_clients_invoices_page.dart';
import 'package:crm_smart/features/support/waiting_agents/presentation/pages/waiting_agents_page.dart';
import 'package:crm_smart/ui/screen/barnch_race/pages/branch_race_view.dart';
import 'package:crm_smart/ui/screen/barnch_race/pages/branch_race_mangement_view.dart';
import 'package:crm_smart/ui/screen/client/calender_client.dart';
import 'package:crm_smart/ui/screen/config/activity_view.dart';
import 'package:crm_smart/ui/screen/config/chang_country.dart';
import 'package:crm_smart/ui/screen/config/company_view.dart';
import 'package:crm_smart/ui/screen/config/main_city_view.dart';
import 'package:crm_smart/ui/screen/config/manage_view.dart';
import 'package:crm_smart/ui/screen/config/regoin_view.dart';
import 'package:crm_smart/ui/screen/config/reson_view.dart';
import 'package:crm_smart/ui/screen/employee_race/pages/employee_race_page.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/user/demo_users_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/navigator/app_routes_paths.dart';
import '../../../../features/clients_care/accept_clients/presentation/pages/clients_accept_page.dart';
import '../../../../features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import '../../../../features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import '../../../../features/clients_care/greeting_communication/presentation/pages/greeting_communication_page.dart';
import '../../../../features/clients_care/install_quality/presentation/pages/install_quality_page.dart';
import '../../../../features/clients_care/periodic_communication/presentation/pages/periodic_communication_page.dart';
import '../../../../features/clients_care/special_clients/presentation/pages/special_clients_page.dart';
import '../../../../features/finance/client_dept/presentation/pages/client_dept_page.dart';
import '../../../../features/finance/clients_attachments/presentation/pages/client_attachments_page.dart';
import '../../../../features/mangement/manage_privileges/privileges/presentation/pages/privileges_page.dart';
import '../../../../features/mangement/manage_users/presentation/pages/manage_users_page.dart';
import '../../../../features/notifications/presentation/pages/notifications_page.dart';
import '../../../../features/sales/clients/clients_list/presentation/pages/clients_list_page/clients_list_page.dart';
import '../../../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../../../features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../../features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../../../features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import '../../../../features/sales/invoices_list/presentation/pages/clients_invoices_page.dart';
import '../../../../features/sales/packages_offers/presentation/pages/packages_offers_page.dart';
import '../../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import '../../../../features/sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../../features/sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';
import '../../../../features/task_management/presentation/pages/task_managment_page.dart';
import '../../../../features/versions/presentation/pages/versions_page.dart';
import '../../../task_management/presentation/pages/add_task_page.dart';
import '../models/favorite_screen_model.dart';

abstract class AvailableScreensRepository {
  List<FavoriteScreenModel> getAllAvailableScreens();
  List<FavoriteScreenModel> getAvailableScreensForUser(
      List<String> userPrivileges);
}

@LazySingleton(as: AvailableScreensRepository)
class AvailableScreensRepositoryImpl implements AvailableScreensRepository {
  AvailableScreensRepositoryImpl();

  @override
  List<FavoriteScreenModel> getAllAvailableScreens() {
    // Create a list of FavoriteScreenModels from AllSubSectionsLists

    // Support Sub Sections
    final supportScreens = AllSubSectionsLists.supportSubSections
        .map((section) => FavoriteScreenModel(
              id: section.path.split('/').last,
              title: section.title,
              iconKey: 'support_agent',
              routeName: section.path,
              privilegeId: section.privilegeId,
              page: section.page,
            ))
        .toList();

    // Care Sub Sections
    final careScreens = AllSubSectionsLists.careSubSections
        .map((section) => FavoriteScreenModel(
              id: section.path.split('/').last,
              title: section.title,
              iconKey: 'support_agent',
              routeName: section.path,
              privilegeId: section.privilegeId,
              page: section.page,
            ))
        .toList();

    // Care Reports
    final careReportScreens = AllSubSectionsLists.careReports
        .map((section) => FavoriteScreenModel(
              id: section.path.split('/').last,
              title: section.title,
              iconKey: 'report',
              routeName: section.path,
              privilegeId: section.privilegeId,
              page: section.page,
            ))
        .toList();

    // Management Sub Sections
    final managementScreens = AllSubSectionsLists.managementSubSections
        .map((section) => FavoriteScreenModel(
              id: section.path.split('/').last,
              title: section.title,
              iconKey: 'settings',
              routeName: section.path,
              privilegeId: section.privilegeId,
              page: section.page,
            ))
        .toList();

    // Finance Sub Sections
    final financeScreens = AllSubSectionsLists.financeSubSection
        .map((section) => FavoriteScreenModel(
              id: section.path.split('/').last,
              title: section.title,
              iconKey: 'attach_money',
              routeName: section.path,
              privilegeId: section.privilegeId,
              page: section.page,
            ))
        .toList();

    // Custom screens that aren't part of AllSubSectionsLists
    final customScreens = [
      // Sales - Clients subsections
      FavoriteScreenModel(
        id: 'clients_list',
        title: 'قائمة العملاء',
        iconKey: 'people',
        routeName: AppRoutesPaths.salesClientsSubSections.clientsList,
        privilegeId: '36',
        page: ClientsListPage(),
      ),
      FavoriteScreenModel(
        id: 'lead_management',
        title: 'ادارة ال lead',
        iconKey: 'trending_up',
        routeName: 'leads',
        privilegeId: '314',
      ),
      FavoriteScreenModel(
        id: 'clients_transfer_approvals',
        title: 'موافقات تحويل العملاء',
        iconKey: 'swap_horiz',
        routeName:
            AppRoutesPaths.salesClientsSubSections.clientsTransferApprovals,
        page: ClientsTransferApprovalsPage(),
      ),
      FavoriteScreenModel(
        id: 'pending_invoices',
        title: 'طلبات موافقة المشرفين',
        iconKey: 'pending_actions',
        routeName: AppRoutesPaths.salesClientsSubSections.pendingInvoices,
        privilegeId: '40',
        page: PendingInvoicesPage(),
      ),
      // Sales - Invoice subsections
      FavoriteScreenModel(
        id: 'clients_invoices',
        title: 'فواتير العملاء',
        iconKey: 'receipt_long',
        routeName: AppRoutesPaths.salesInvoiceSubSections.clientsInvoices,
        privilegeId: '39',
        page: ClientsInvoicesPage(),
      ),
      FavoriteScreenModel(
        id: 'deleted_invoices',
        title: 'الفواتير المحذوفة',
        iconKey: 'delete_sweep',
        routeName: AppRoutesPaths.salesInvoiceSubSections.deletedInvoices,
        privilegeId: '14',
        page: DeletedInvoicesPage(),
      ),
      // Sales - Relation subsections
      FavoriteScreenModel(
        id: 'participate_list',
        title: 'المتعاونين',
        iconKey: 'group_work',
        routeName: AppRoutesPaths.salesRelationSubSections.participateList,
        privilegeId: '113',
        page: ParticipateListPage(),
      ),
      FavoriteScreenModel(
        id: 'agents_distributors',
        title: 'الوكلاء والموزعين',
        iconKey: 'admin_panel_settings',
        routeName:
            AppRoutesPaths.salesRelationSubSections.agentsAndDistributors,
        privilegeId: '114',
        page: AgentsAndDistributorsPage(),
      ),
      // Sales - Reports subsections
      FavoriteScreenModel(
        id: 'employees_sales_reports',
        title: 'تقارير مبيعات الموظفين',
        iconKey: 'bar_chart',
        routeName: AppRoutesPaths.salesReportsSubSections.employeesSalesReports,
        privilegeId: '85',
        page: EmployeesSalesReportsPage(),
      ),
      FavoriteScreenModel(
        id: 'regions_sales_reports',
        title: 'تقارير مبيعات الفروع',
        iconKey: 'pie_chart',
        routeName: AppRoutesPaths.salesReportsSubSections.regionsSalesReports,
        privilegeId: '86',
        page: RegionsSalesReportsPage(),
      ),
      // Task subsections
      FavoriteScreenModel(
        id: 'tasks',
        title: 'المهام',
        iconKey: 'task_alt',
        routeName: AppRoutesPaths.homeSections.taskManagement,
        privilegeId: '18',
        page: TaskManagementPage(),
      ),
      // Additional screens
      FavoriteScreenModel(
        id: 'packages_offer',
        title: 'العروض والباقات',
        iconKey: 'local_offer',
        routeName: AppRoutesPaths.salesSections.packagesOffer,
        privilegeId: '224',
        page: PackagesOffersPage(),
      ),
      // Notifications & Versions
      FavoriteScreenModel(
        id: 'notifications',
        title: 'الإشعارات',
        iconKey: 'notifications',
        routeName: AppRoutesPaths.notifications,
        page: NotificationsPage(),
      ),
      FavoriteScreenModel(
        id: 'versions',
        title: 'الإصدارات',
        iconKey: 'update',
        routeName: AppRoutesPaths.versions,
        privilegeId: '225',
        page: VersionsPage(),
      ),
      // More custom screens from the original list
      FavoriteScreenModel(
        id: 'clients_contacts',
        title: 'قائمة جهات الاتصال',
        iconKey: 'contacts',
        routeName: AppRoutesPaths.salesClientsSubSections.clientsContacts,
        privilegeId: '301',
        page: ClientsContactsPage(),
      ),
      FavoriteScreenModel(
        id: 'latest_clients_updates',
        title: 'آخر تحديثات العملاء',
        iconKey: 'update',
        routeName: AppRoutesPaths.salesClientsSubSections.latestClientsUpdates,
        privilegeId: '119',
        page: LatestClientsUpdatesPage(),
      ),
      FavoriteScreenModel(
        id: 'clients_debts',
        title: 'ديون العملاء',
        iconKey: 'account_balance_wallet',
        routeName: AppRoutesPaths.salesClientsSubSections.clientsDebts,
        privilegeId: '39',
        page: ClientsDebtsPage(),
      ),
      FavoriteScreenModel(
        id: 'finance_pending',
        title: 'طلبات اعتماد المالية',
        iconKey: 'attach_money',
        routeName: AppRoutesPaths.salesClientsSubSections.financePending,
        privilegeId: '111',
        page: FinancePendingPage(),
      ),
      FavoriteScreenModel(
        id: 'exceeded_clients',
        title: 'تحويلات عملاء التسويق لميداني',
        iconKey: 'transfer_within_a_station',
        routeName: AppRoutesPaths.salesClientsSubSections.exceededClients,
        privilegeId: '233',
        page: ExceededClientsPage(),
      ),
      // FavoriteScreenModel(
      //   id: 'calender_client',
      //   title: 'جدول زيارات العميل',
      //   iconKey: 'calendar_today',
      //   routeName: AppRoutesPaths.salesClientsSubSections.calenderClient,
      //   privilegeId: '120',
      //   page: calender_client(),
      // ),
      FavoriteScreenModel(
        id: 'manage_withdrawn_invoices',
        title: 'إدارة الفواتير المنسحبة',
        iconKey: 'exit_to_app',
        routeName:
            AppRoutesPaths.salesInvoiceSubSections.manageWithdrawnInvoices,
        privilegeId: '143',
        page: ManageWithdrawnInvoicesPage(),
      ),
      FavoriteScreenModel(
        id: 'withdrawn_invoices',
        title: 'الفواتير المنسحبة',
        iconKey: 'cancel',
        routeName: AppRoutesPaths.salesInvoiceSubSections.withdrawnInvoices,
        privilegeId: '35',
        page: WithdrawnInvoicesPage(),
      ),
      FavoriteScreenModel(
        id: 'company_view',
        title: 'الشركات المنافسة',
        iconKey: 'business',
        routeName: AppRoutesPaths.salesRelationSubSections.companyView,
        privilegeId: '115',
        page: company_view(type: 'ticket'),
      ),
      FavoriteScreenModel(
        id: 'important_links',
        title: 'الروابط الهامة',
        iconKey: 'link',
        routeName: AppRoutesPaths.salesRelationSubSections.importantLinks,
        page: ImportantLinksPage(),
      ),
      FavoriteScreenModel(
        id: 'demo_users',
        title: 'يوزرات تجريبية',
        iconKey: 'person_outline',
        routeName: AppRoutesPaths.salesRelationSubSections.usertestView,
        page: DemoUsersPage(),
      ),
      FavoriteScreenModel(
        id: 'products_sales_reports',
        title: 'تقارير مبيعات المنتجات',
        iconKey: 'shopping_cart',
        routeName: AppRoutesPaths.salesReportsSubSections.productsSalesReports,
        privilegeId: '88',
        page: ProductsSalesReportsPage(),
      ),
      FavoriteScreenModel(
        id: 'clients_debts_reports',
        title: 'تقارير ديون العملاء',
        iconKey: 'account_balance',
        routeName: AppRoutesPaths.salesReportsSubSections.clientsDebtsReports,
        privilegeId: '91',
        page: ClientsDebtsReportsPage(),
      ),
      FavoriteScreenModel(
        id: 'clients_status_reports',
        title: 'تقارير حالات العملاء',
        iconKey: 'assessment',
        routeName: AppRoutesPaths.salesReportsSubSections.clientsStatusReports,
        privilegeId: '95',
        page: ClientsStatusReportsPage(),
      ),
      FavoriteScreenModel(
        id: 'employee_race',
        title: 'سباق الموظفين',
        iconKey: 'emoji_events',
        routeName: AppRoutesPaths.salesRaceSubSections.employeeRace,
        privilegeId: '118',
        page: EmployeeRacePage(),
      ),
      FavoriteScreenModel(
        id: 'sales_branch_race',
        title: 'سباق الفروع',
        iconKey: 'military_tech',
        routeName: AppRoutesPaths.salesRaceSubSections.salesBranchRace,
        privilegeId: '117',
        page: BranchRaceView(),
      ),
      FavoriteScreenModel(
        id: 'add_task',
        title: 'إضافة مهمة',
        iconKey: 'add_task',
        routeName: 'add-task',
        privilegeId: '19',
        page: AddTaskPage()
      ),
      FavoriteScreenModel(
        id: 'task_reports',
        title: 'تقارير المهام',
        iconKey: 'summarize',
        routeName: 'taskManagementreports',
        privilegeId: '223',
      ),
    ];

    // Combine all lists
    return [
      ...supportScreens,
      ...careScreens,
      ...careReportScreens,
      ...managementScreens,
      ...financeScreens,
      ...customScreens
    ];
  }

  @override
  List<FavoriteScreenModel> getAvailableScreensForUser(
      List<String> userPrivileges) {
    final allScreens = getAllAvailableScreens();
    return allScreens
        .where((screen) =>
            screen.privilegeId == null ||
            userPrivileges.contains(screen.privilegeId))
        .toList();
  }
}
