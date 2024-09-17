import '../../../features/clients_care/accept_clients/presentation/pages/clients_accept_page.dart';
import '../../../features/clients_care/clients_care_reports/presentation/pages/clients_care_reports_page.dart';
import '../../../features/clients_care/clients_not_using_system/presentation/pages/not_using_system_page.dart';
import '../../../features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import '../../../features/clients_care/clients_wrong_numbers/presentation/pages/wrong_numbers_page.dart';
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
import '../../../features/support/delay_after_install/presentation/pages/delay_after_install_report_page.dart';
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
import '../../config/navigator/app_routes_paths.dart';
import '../../utils/app_strings.dart';
import '../models/sections/section_model.dart';

abstract class AllSubSectionsLists {
  /* Support Sub Sections */

  static final List<SectionModel> supportSubSections = [
    SectionModel(
      title: 'العملاء المشتركين',
      page: SupportClientsAcceptPage(),
      privilegeId: '19',
      path: AppRoutesPaths.supportSubSections.supportClientsAccept,
    ),
    SectionModel(
      title: 'فواتير العملاء',
      page: SupportClientsInvoicesPage(),
      privilegeId: '34',
      path: AppRoutesPaths.supportSubSections.supportClientsInvoices,
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
      path: AppRoutesPaths.supportSubSections.datesTable,
    ),
    SectionModel(
      title: 'تقارير التركيب للعملاء',
      page: ClientsInstallReportsPage(),
      privilegeId: '99',
      path: AppRoutesPaths.supportSubSections.clientsInstallReports,
    ),
    SectionModel(
      title: 'تقرير التأخير عن الجدولة للعملاء',
      page: DelayInstallReportsPage(),
      privilegeId: '100',
      path: AppRoutesPaths.supportSubSections.delayInstallReports,
    ),
    SectionModel(
      title: 'تقرير التأخير عن التركيب للعملاء',
      page: DelayAfterInstallReportPage(),
      privilegeId: '101',
      path: AppRoutesPaths.supportSubSections.delayAfterInstall,
    ),
    SectionModel(
      title: 'وكلاء في انتظار التدريب',
      page: WaitingAgentsPage(),
      privilegeId: '195',
      path: AppRoutesPaths.supportSubSections.waitingAgents,
    ),
  ];

  /* Care Sub Sections */

  static final List<SectionModel> careSubSections = [
    SectionModel(
      title: 'العملاء المشتركين',
      page: ClientsAcceptPage(),
      privilegeId: '44',
      path: AppRoutesPaths.careSubSections.clientsAccept,
    ),
    SectionModel(
      title: 'قائمة العملاء المميزين',
      page: SpecialClientsPage(),
      privilegeId: '137',
      path: AppRoutesPaths.careSubSections.specialClients,
    ),
    SectionModel(
      title: 'الترحيب بالعملاء',
      page: GreetingCommunicationPage(),
      privilegeId: '29',
      path: AppRoutesPaths.careSubSections.greetingCommunication,
    ),
    SectionModel(
      title: 'جودة التركيب والتدريب',
      page: InstallQualityPage(),
      privilegeId: '30',
      path: AppRoutesPaths.careSubSections.installQuality,
    ),
    SectionModel(
      title: 'التواصل الدوري',
      page: PeriodicCommunicationPage(),
      privilegeId: '9',
      path: AppRoutesPaths.careSubSections.periodicCommunication,
    ),
    SectionModel(
      title: 'تقرير إعادة التقييم',
      page: PreviousRatingsPage(),
      privilegeId: '30',
      path: AppRoutesPaths.careSubSections.previousRatings,
    ),
    SectionModel(
      title: 'تذاكر العملاء',
      page: TicketsPage(),
      privilegeId: '33',
      path: AppRoutesPaths.careSubSections.tickets,
    ),
    SectionModel(
      title: 'تقرير العناية بالعملاء',
      page: ClientsCareReportsPage(),
      privilegeId: '102',
      path: AppRoutesPaths.careSubSections.clientsCareReports,
    ),
    SectionModel(
      title: 'تقرير مستوى التقييم',
      page: EvaluationLevelReportPage(),
      privilegeId: '103',
      path: AppRoutesPaths.careSubSections.evaluationLevelReport,
    ),
    SectionModel(
      title: AppStrings.periodicCommunicaitonReportsLabel,
      page: PeriodicCommunicationReportsPage(),
      privilegeId: '104',
      path: AppRoutesPaths.careSubSections.periodicCommunicationReports,
    ),
    SectionModel(
      title: AppStrings.labelNotUse,
      page: NotUsingSystemPage(),
      privilegeId: '105',
      path: AppRoutesPaths.careSubSections.notUsingSystem,
    ),
    SectionModel(
      title: AppStrings.labelWrongNumber,
      page: WrongNumbersPage(),
      privilegeId: '106',
      path: AppRoutesPaths.careSubSections.wrongNumbers,
    ),
  ];

  /* Management Sub Sections */

  static final List<SectionModel> managementSubSections = [
    SectionModel(
      title: 'إدارة المستخدمين',
      page: ManageUserPage(),
      privilegeId: '3',
      path: AppRoutesPaths.managementSubSections.manageUsers,
    ),
    SectionModel(
      title: 'إدارة الصلاحيات',
      page: LevelsPage(),
      privilegeId: '17',
      path: AppRoutesPaths.managementSubSections.managePrivileges,
    ),
    SectionModel(
      title: 'إدارة الإنسحابات',
      page: ManageWithdrawalsPage(),
      privilegeId: '142',
      path: AppRoutesPaths.managementSubSections.manageWithdrawals,
    ),
    SectionModel(
      title: 'إدارة أسباب الاستبعاد',
      page: ManageRejectReasonsPage(),
      path: AppRoutesPaths.managementSubSections.manageRejectReasons,
    ),
    SectionModel(
      title: 'المنتجات',
      page: ProductView(),
      privilegeId: '4',
      path: AppRoutesPaths.managementSubSections.products,
    ),
    SectionModel(
      title: 'تغيير الدولة',
      page: ChangeCountry(),
      privilegeId: '52',
      path: AppRoutesPaths.managementSubSections.changeCountry,
    ),
    SectionModel(
      title: 'إداراة الفروع',
      page: RegoinView(),
      privilegeId: '63',
      path: AppRoutesPaths.managementSubSections.regions,
    ),
    SectionModel(
      title: 'إضافة الإدارات',
      page: ManageView(),
      privilegeId: '64',
      path: AppRoutesPaths.managementSubSections.departments,
    ),
    SectionModel(
      title: 'أسباب الانسحاب',
      page: resoan_view(type: 'client'),
      privilegeId: '73',
      path: AppRoutesPaths.managementSubSections.withdrawalReasons,
    ),
    SectionModel(
      title: 'ادارة المناطق والمدن',
      page: maincityview(),
      privilegeId: '77',
      path: AppRoutesPaths.managementSubSections.regionsAndCities,
    ),
    SectionModel(
      title: 'أنواع التذاكر',
      page: resoan_view(type: 'ticket'),
      privilegeId: '74',
      path: AppRoutesPaths.managementSubSections.ticketTypes,
    ),
    SectionModel(
      title: 'أنواع النشاط',
      page: activity_view(type: 'ticket'),
      path: AppRoutesPaths.managementSubSections.activityTypes,
    ),
    SectionModel(
      title: 'سباق الفروع',
      page: BranchRaceManagementView(),
      privilegeId: '149',
      path: AppRoutesPaths.managementSubSections.branchRace,
    ),
    SectionModel(
      title: 'الإعدادات المتقدمة',
      page: AdvancedCofigsPage(),
      privilegeId: '215',
      path: AppRoutesPaths.managementSubSections.advancedConfigs,
    ),
    SectionModel(
      title: 'الاعدادات العامة',
      page: GeneralCofigsPage(),
      privilegeId: '216',
      path: AppRoutesPaths.managementSubSections.generalConfigs,
    ),
  ];
}
