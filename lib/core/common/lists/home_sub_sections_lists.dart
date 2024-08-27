import '../../../features/clients_care/accept_clients/presentation/pages/clients_accept_page.dart';
import '../../../features/clients_care/clients_care_reports/presentation/pages/clients_care_reports_page.dart';
import '../../../features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import '../../../features/clients_care/evaluation_level_report/presentation/pages/evaluation_level_report_page.dart';
import '../../../features/clients_care/greeting_communication/presentation/pages/greeting_communication_page.dart';
import '../../../features/clients_care/install_quality/presentation/pages/install_quality_page.dart';
import '../../../features/clients_care/periodic_communication/presentation/pages/periodic_communication_page.dart';
import '../../../features/clients_care/periodic_communication_reports/presentation/pages/periodic_communication_reports_page.dart';
import '../../../features/clients_care/previous_ratings/presentation/pages/previous_ratings_page.dart';
import '../../../features/clients_care/special_clients/presentation/pages/special_clients_page.dart';
import '../../../features/mangement/advanced_configs/presentation/pages/advanced_cofigs_page.dart';
import '../../../features/mangement/general_configs/presentation/pages/general_cofigs_page.dart';
import '../../../features/mangement/manage_privileges/levels/presentation/pages/levels_page.dart';
import '../../../features/mangement/manage_users/presentation/pages/manage_users_page.dart';
import '../../../features/mangement/manage_withdrawals/presentation/pages/manage_reject_reasons_page.dart';
import '../../../features/mangement/manage_withdrawals/presentation/pages/manage_withdrawals_page.dart';
import '../../../features/support/clients_install_reports/presentation/pages/clients_install_reports_page.dart';
import '../../../features/support/dates_table/presentation/pages/dates_table_page.dart';
import '../../../features/support/delay_after_install/presentation/pages/delay_after_install_page.dart';
import '../../../features/support/delay_install_reports/presentation/pages/delay_install_reports_page.dart';
import '../../../features/support/support_accept_clients/presentation/pages/support_clients_accept_page.dart';
import '../../../features/support/support_clients_invoices/presentation/pages/support_clients_invoices_page.dart';
import '../../../features/support/waiting_agents/presentation/pages/waiting_agents_page.dart';
import '../../../ui/screen/barnch_race/pages/branch_race_mangement_view.dart';
import '../../../ui/screen/config/activity_view.dart';
import '../../../ui/screen/config/chang_country.dart';
import '../../../ui/screen/config/maincityview.dart';
import '../../../ui/screen/config/manageview.dart';
import '../../../ui/screen/config/regoin_view.dart';
import '../../../ui/screen/config/reson_view.dart';
import '../../../ui/screen/product/productView.dart';
import '../../../ui/screen/report/not_using_system.dart';
import '../../../ui/screen/report/wrong_number.dart';
import '../../utils/app_strings.dart';
import '../models/sections/section_model.dart';

abstract class SubSectionsLists {
  /* Support Sub Sections */

  static final List<SectionModel> supportSubSections = [
    SectionModel(
      title: 'العملاء المشتركين',
      page: SupportClientsAcceptPage(),
      privilegeId: '19',
    ),
    SectionModel(
      title: 'فواتير العملاء',
      page: SupportClientsInvoicesPage(),
      privilegeId: '34',
    ),

    // SubSectionModel(
    //   title: 'قائمة العملاء المميزين',
    //   destination: CommunicationListPage(),
    //   privilegeId: '137',
    // ),

    SectionModel(
      title: 'جدول التركيب للعملاء',
      page: DatesTablePage(),
      privilegeId: '18',
    ),
    SectionModel(
      title: 'تقارير التركيب للعملاء',
      page: ClientsInstallReportsPage(),
      privilegeId: '99',
    ),
    SectionModel(
      title: 'تقرير التأخير عن الجدولة للعملاء',
      page: DelayInstallReportsPage(),
      privilegeId: '100',
    ),
    SectionModel(
      title: 'تقرير التأخير عن التركيب للعملاء',
      page: DelayAfterInstallPage(),
      privilegeId: '101',
    ),
    SectionModel(
      title: 'وكلاء في انتظار التدريب',
      page: WaitingAgentsPage(),
      privilegeId: '195',
    ),
  ];

  /* Care Sub Sections */

  static final List<SectionModel> careSubSections = [
    SectionModel(
      title: 'العملاء المشتركين',
      page: ClientsAcceptPage(),
      privilegeId: '44',
    ),
    SectionModel(
      title: 'قائمة العملاء المميزين',
      page: SpecialClientsPage(),
      privilegeId: '137',
    ),
    SectionModel(
      title: 'الترحيب بالعملاء',
      page: GreetingCommunicationPage(),
      privilegeId: '29',
    ),
    SectionModel(
      title: 'جودة التركيب والتدريب',
      page: InstallQualityPage(),
      privilegeId: '30',
    ),
    SectionModel(
      title: 'التواصل الدوري',
      page: PeriodicCommunicationPage(),
      privilegeId: '9',
    ),
    SectionModel(
      title: 'تقرير إعادة التقييم',
      page: PreviousRatingsPage(),
      privilegeId: '30',
    ),
    SectionModel(
      title: 'تذاكر العملاء',
      page: TicketsPage(),
      privilegeId: '33',
    ),
    SectionModel(
      title: 'تقرير العناية بالعملاء',
      page: ClientsCareReportsPage(),
      privilegeId: '102',
    ),
    SectionModel(
      title: 'تقرير مستوى التقييم',
      page: EvaluationLevelReportPage(),
      privilegeId: '103',
    ),
    SectionModel(
      title: AppStrings.periodicCommunicaitonReportsLabel,
      page: PeriodicCommunicationReportsPage(),
      privilegeId: '104',
    ),
    SectionModel(
      title: AppStrings.labelNotUse,
      page: not_using_system(),
      privilegeId: '105',
    ),
    SectionModel(
      title: AppStrings.labelWrongNumber,
      page: wrong_number(),
      privilegeId: '106',
    ),
  ];

  /* Management Sub Sections */

  static final List<SectionModel> managementSubSections = [
    SectionModel(
      title: 'إدارة المستخدمين',
      page: ManageUserPage(),
      privilegeId: '3',
    ),
    SectionModel(
      title: 'إدارة الصلاحيات',
      page: LevelsPage(),
      privilegeId: '17',
    ),
    SectionModel(
      title: 'إدارة الإنسحابات',
      page: ManageWithdrawalsPage(),
      privilegeId: '142',
    ),
    SectionModel(
      title: 'إدارة أسباب الاستبعاد',
      page: ManageRejectReasonsPage(),
    ),
    SectionModel(
      title: 'المنتجات',
      page: ProductView(),
      privilegeId: '4',
    ),
    SectionModel(
      title: 'تغيير الدولة',
      page: change_country(),
      privilegeId: '52',
    ),
    SectionModel(
      title: 'إداراة الفروع',
      page: regoinview(),
      privilegeId: '63',
    ),
    SectionModel(
      title: 'إضافة الإدارات',
      page: managview(),
      privilegeId: '64',
    ),
    SectionModel(
      title: 'أسباب الانسحاب',
      page: resoan_view(type: 'client'),
      privilegeId: '73',
    ),
    SectionModel(
      title: 'ادارة المناطق والمدن',
      page: maincityview(),
      privilegeId: '77',
    ),
    SectionModel(
      title: 'أنواع التذاكر',
      page: resoan_view(type: 'ticket'),
      privilegeId: '74',
    ),
    SectionModel(
      title: 'أنواع النشاط',
      page: activity_view(type: 'ticket'),
    ),
    SectionModel(
      title: 'سباق الفروع',
      page: BranchRaceManagementView(),
      privilegeId: '149',
    ),
    SectionModel(
      title: 'الإعدادات المتقدمة',
      page: AdvancedCofigsPage(),
      privilegeId: '215',
    ),
    SectionModel(
      title: 'الاعدادات العامة',
      page: GeneralCofigsPage(),
      privilegeId: '216',
    ),
  ];
}
