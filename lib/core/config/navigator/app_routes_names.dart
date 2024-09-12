abstract class AppRoutesNames {
  static final _GeneralRoutes generalRoutes = _GeneralRoutes();
  static final _ClientProfile clientProfile = _ClientProfile();
  static final _ClientDashboard clientDashboard = _ClientDashboard();
  static final _ParticipateProfile participateProfile = _ParticipateProfile();
  static final _AgentProfile agentProfile = _AgentProfile();
  static final _UserProfile userProfile = _UserProfile();
  static final _Invoices invoices = _Invoices();
  static final _ManagementRoutes managementInternalRoutes = _ManagementRoutes();
}

class _GeneralRoutes {
  final String splashScreen = 'splash-screen';
  final String updateApp = 'update-app';
  final String login = 'login';
  final String otp = 'otp';
  final String notAllowed = 'not-allowed';
  final String home = 'home';
}

class _ClientProfile {
  final String inClientsList = 'client-profile-in-clients-list';
  final String inLatestClientsUpdates =
      'client-profile-in-latest-clients-updates';
  final String inClientsDebts = 'client-profile-in-clients-debts';
  final String inClientsTransferApprovals =
      'client-profile-in-clients-transfer-approvals';

  final String inExceededClients = 'client-profile-in-exceeded-clients';

  final String inSupportAcceptClients =
      'client-profile-in-support-accept-clients';
  final String inSupportClientsInvoices =
      'client-profile-in-support-clients-invoices';

  final String inCareAcceptClients = 'client-profile-in-care-accept-clients';
  final String inCareSpecialClients = 'client-profile-in-care-special-clients';
  final String inCareGreetingCommunication =
      'client-profile-in-care-greeting-communication';
  final String inCareInstallQuality = 'client-profile-in-care-install-quality';
  final String inCarePeriodicCommunication =
      'client-profile-in-care-periodic-communication';
  final String inCarePeriodicCommunicationReports =
      'client-profile-in-care-periodic-communication-reports';
  final String inCareEvaluationLevelReport =
      'client-profile-in-care-evaluation-level-report';
  final String inCareNotUsingSystem = 'client-profile-in-care-not-using-system';
  final String inCareWrongNumbers = 'client-profile-in-care-wrong-numbers';
}

class _ClientDashboard {
  final String inPendingInvoices = 'client-dashboard-in-pending-invoices';
  final String inFinancePending = 'client-dashboard-in-finance-pending';
}

class _ParticipateProfile {
  final String inParticipateList = 'participate-profile-in-participate-list';
}

class _AgentProfile {
  final String inAgentsAndDistributors =
      'agent-profile-in-agents-and-distributors';
  final String inWaitingAgents = 'agent-profile-in-waiting-agents';
}

class _UserProfile {
  final String inUsersList = 'user-profile-in-users-list';
}

class _Invoices {
  final String deletedInvoiceDetailsPage = 'deleted-invoice-details-page';
}

class _ManagementRoutes {
  final String privilegesPage = 'privileges-page';
  final String addUser = 'add-user-page';
}
