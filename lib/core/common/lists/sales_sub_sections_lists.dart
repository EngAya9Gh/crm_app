import '../../../features/sales/clients/clients_debts/presentation/pages/clients_debts_page.dart';
import '../../../features/sales/clients/clients_list/presentation/pages/clients_list_page.dart';
import '../../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../../features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../../features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import '../../../features/sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';
import '../../../features/sales/invoices_list/presentation/pages/clients_invoices_page.dart';
import '../../../features/sales/manage_withdrawn_invoices/presentation/pages/manage_withdrawn_invoices_page.dart';
import '../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../features/sales/public_relations/links/presentation/pages/manage_links_page.dart';
import '../../../features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import '../../../features/sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import '../../../features/sales/reports/clients_status_reports/presentation/pages/clients_status_reports_page.dart';
import '../../../features/sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../features/sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import '../../../features/sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';
import '../../../features/sales/withdrawn_invoices/presentation/pages/withdrawn_invoices_page.dart';
import '../../../ui/screen/barnch_race/pages/branch_race_view.dart';
import '../../../ui/screen/client/calender_client.dart';
import '../../../ui/screen/config/company_view.dart';
import '../../../ui/screen/employee_race/pages/employee_race_page.dart';
import '../../../ui/screen/invoice/deleted_invoices.dart';
import '../../../ui/screen/user/usertest_view.dart';
import '../models/sections/section_model.dart';

abstract class SalesSubSectionsLists {
  /* Clients Sub Sections */

  static final List<SectionModel> clientsSubSections = [
    SectionModel(
      title: 'قائمة العملاء',
      page: ClientsListPage(),
      privilegeId: '36',
    ),
    SectionModel(
      title: 'آخر تحديثات العملاء',
      page: LatestClientsUpdatesPage(),
      privilegeId: '119',
    ),
    SectionModel(
      title: 'ديون العملاء',
      page: ClientsDebtsPage(),
      privilegeId: '39',
    ),
    SectionModel(
      title: 'جدول زيارات العميل',
      page: calender_client(),
      privilegeId: '120',
    ),
    SectionModel(
      title: 'موافقات تحويل العملاء',
      page: ClientsTransferApprovalsPage(),
    ),
    SectionModel(
      title: 'طلبات موافقة المشرفين',
      page: PendingInvoicesPage(),
      privilegeId: '40',
    ),
    SectionModel(
      title: 'طلبات اعتماد المالية',
      page: FinancePendingPage(),
      privilegeId: '111',
    ),
    SectionModel(
      title: 'تحويلات عملاء التسويق لميداني',
      page: ExceededClientsPage(),
      privilegeId: '233',
    ),
  ];

  /* Invoice Sub Sections */

  static final List<SectionModel> invoiceSections = [
    SectionModel(
      title: 'فواتير العملاء',
      page: ClientsInvoicesPage(),
      privilegeId: '39',
    ),
    SectionModel(
      title: 'الفواتير المحذوفة',
      page: DeletedInvoicesPage(),
      privilegeId: '14',
    ),
    SectionModel(
      title: 'الفواتير المحذوفة',
      page: deletedInvoices(),
      privilegeId: '14',
    ),
    SectionModel(
      title: 'إدارة الفواتير المنسحبة',
      page: ManageWithdrawnInvoicesPage(),
      privilegeId: '143',
    ),
    SectionModel(
      title: 'الفواتير المنسحبة',
      page: WithdrawnInvoicesPage(),
      privilegeId: '35',
    ),
  ];

  /* Relation Sub Sections */

  static final List<SectionModel> relationSections = [
    SectionModel(
      title: 'المتعاونين',
      page: ParticipateListPage(),
      privilegeId: '113',
    ),
    SectionModel(
      title: 'الوكلاء والموزعين',
      page: AgentsAndDistributorsPage(),
      privilegeId: '114',
    ),
    SectionModel(
      title: 'الشركات المنافسة',
      page: company_view(type: 'ticket'),
    ),
    SectionModel(
      title: 'الروابط الهامة',
      page: ManageLinkPage(),
    ),
    SectionModel(
      title: 'يوزرات تجريبية',
      page: usertest_view(),
    ),
  ];

  /* Reports Sub Sections */

  static final List<SectionModel> reportsSections = [
    SectionModel(
      title: 'تقارير مبيعات الموظفين',
      page: EmployeesSalesReportsPage(),
      privilegeId: '85',
    ),
    SectionModel(
      title: 'تقارير مبيعات الفروع',
      page: RegionsSalesReportsPage(),
      privilegeId: '86',
    ),
    SectionModel(
      title: 'تقارير مبيعات المنتجات',
      page: ProductsSalesReportsPage(),
      privilegeId: '88',
    ),
    SectionModel(
      title: 'تقارير ديون العملاء',
      page: ClientsDebtsReportsPage(),
      privilegeId: '91',
    ),
    SectionModel(
      title: 'تقارير حالات العملاء',
      page: ClientsStatusReportsPage(),
      privilegeId: '95',
    ),
  ];

  /* Race Sub Sections */

  static final List<SectionModel> raceSections = [
    SectionModel(
      title: 'سباق الموظفين',
      page: EmployeeRacePage(),
      privilegeId: '118',
    ),
    SectionModel(
      title: 'سباق الفروع',
      page: BranchRaceView(),
      privilegeId: '117',
    ),
  ];
}
