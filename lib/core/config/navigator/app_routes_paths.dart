import '../../../features/app/presentation/pages/not_allowed_page.dart';
import '../../../features/app/presentation/pages/splash_screen.dart';
import '../../../features/app/presentation/pages/update_app_page.dart';
import '../../../features/auth/login/presentation/pages/login_page.dart';
import '../../../features/auth/login/presentation/pages/verify_otp_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/home/presentation/pages/sales_section.dart';

abstract class AppRoutesPaths {
  static final Map<String, String> routeFullPathByName = {
    SplashScreen().toString(): init.splashScreen,
    UpdateAppPage().toString(): init.updateApp,
    LoginPage().toString(): auth.login,
    VerifyOtpPage().toString(): "${auth.login}/${auth.otp}",
    NotAllowedPage().toString(): notAllowed,
    HomePage().toString(): home,
    SalesSection().toString(): "${home}/${homeSections.sales}",
  };

  static final _AppInit init = _AppInit();
  static final _Auth auth = _Auth();
  static final _HomeSections homeSections = _HomeSections();
  static final _SalesSections salesSections = _SalesSections();
  static final _SupportSubSections supportSubSections = _SupportSubSections();
  static final _CareSubSections careSubSections = _CareSubSections();
  static final _ManagementSubSections managementSubSections =
      _ManagementSubSections();
  static final _SalesClientsSubSections salesClientsSubSections =
      _SalesClientsSubSections();
  static final _SalesInvoiceSubSections salesInvoiceSubSections =
      _SalesInvoiceSubSections();
  static final _SalesRelationSubSections salesRelationSubSections =
      _SalesRelationSubSections();
  static final _SalesReportsSubSections salesReportsSubSections =
      _SalesReportsSubSections();
  static final _SalesRaceSubSections salesRaceSubSections =
      _SalesRaceSubSections();

  static const String notAllowed = '/not-allowed';
  static const String home = '/home';
}

class _AppInit {
  final String splashScreen = '/';
  final String updateApp = '/update-app';
}

class _Auth {
  final String login = '/login';
  final String otp = 'otp';
}

class _HomeSections {
  final String sales = 'sales';
  final String support = 'support';
  final String care = 'care';
  final String management = 'management';
  final String taskManagement = 'taskManagement';
}

class _SalesSections {
  final String clients = 'clients';
  final String invoices = 'invoices';
  final String relations = 'relations';
  final String reports = 'reports';
  final String races = 'races';
}

class _SupportSubSections {
  final String supportClientsAccept = 'support-clients-accept';
  final String supportClientsInvoices = 'support-clients-invoices';
  final String datesTable = 'dates-table';
  final String clientsInstallReports = 'install-reports';
  final String delayInstallReports = 'delay-install-reports';
  final String delayAfterInstall = 'delay-after-install';
  final String waitingAgents = 'waiting-agents';
}

class _CareSubSections {
  final String clientsAccept = 'clients-accept';
  final String specialClients = 'special-clients';
  final String greetingCommunication = 'greeting-communication';
  final String installQuality = 'install-quality';
  final String periodicCommunication = 'periodic-communication';
  final String previousRatings = 'previous-ratings';
  final String tickets = 'tickets';
  final String clientsCareReports = 'clients-care-reports';
  final String evaluationLevelReport = 'evaluation-level-report';
  final String periodicCommunicationReports = 'periodic-communication-reports';
  final String notUsingSystem = 'not-using-system';
  final String wrongNumbers = 'wrong-numbers';
}

class _ManagementSubSections {
  final String manageUsers = 'manage-users';
  final String managePrivileges = 'levels';
  final String manageWithdrawals = 'manage-withdrawals';
  final String manageRejectReasons = 'manage-reject-reasons';
  final String products = 'products';
  final String changeCountry = 'change-country';
  final String regions = 'regions';
  final String departments = 'departments';
  final String withdrawalReasons = 'withdrawal-reasons';
  final String regionsAndCities = 'regions-and-cities';
  final String ticketTypes = 'ticket-types';
  final String activityTypes = 'activity-types';
  final String branchRace = 'branch-race';
  final String advancedConfigs = 'advanced-configs';
  final String generalConfigs = 'general-configs';
}

class _SalesClientsSubSections {
  final String clientsList = 'clients-list';
  final String latestClientsUpdates = 'latest-clients-updates';
  final String clientsDebts = 'clients-debts';
  final String calenderClient = 'calender-client';
  final String clientsTransferApprovals = 'clients-transfer-approvals';
  final String pendingInvoices = 'pending-invoices';
  final String financePending = 'finance-pending';
  final String exceededClients = 'exceeded-clients';
}

class _SalesInvoiceSubSections {
  final String clientsInvoices = 'clients-invoices';
  final String deletedInvoices = 'deleted-invoices';
  final String manageWithdrawnInvoices = 'manage-withdrawn-invoices';
  final String withdrawnInvoices = 'withdrawn-invoices';
}

class _SalesRelationSubSections {
  final String participateList = 'participate-list';
  final String agentsAndDistributors = 'agents-and-distributors';
  final String companyView = 'company-view';
  final String importantLinks = 'important-links';
  final String usertestView = 'usertest-view';
}

class _SalesReportsSubSections {
  final String employeesSalesReports = 'employees-sales-reports';
  final String regionsSalesReports = 'regions-sales-reports';
  final String productsSalesReports = 'products-sales-reports';
  final String clientsDebtsReports = 'clients-debts-reports';
  final String clientsStatusReports = 'clients-status-reports';
}

class _SalesRaceSubSections {
  final String employeeRace = 'employee-race';
  final String salesBranchRace = 'sales-branch-race';
}
