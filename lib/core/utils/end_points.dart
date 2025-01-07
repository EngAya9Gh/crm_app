import 'package:flutter/foundation.dart' show debugPrint;

import '../common/enums/enums.dart';

abstract class EndPoints {
  EndPoints._();

  static AppMode appMode = AppMode.development;

  static final baseUrls = _BaseUrls();
  static const auth = _Auth();
  static const care = _Care();
  static const client = _Client();
  static const users = _Users();
  static const link = _Links();
  static const company = _Company();
  static const series = _Series();
  static const app = _App();
  static const privilege = _Privilege();
  static const task = _Task();
  static const participate = _Participate();
  static const city = _City();
  static const agentDistributor = _AgentDistributor();
  static const invoice = _Invoice();
  static const tickets = _Tickets();
  static const events = _Events();
  static const configs = _Configs();
  static const support = _Support();
  static const reports = _Reports();
  static const notifications = _Notifications();
  static const versions = _Versions();
  static const products = _Products();
  static const management = _Management();
  static const reason = _Reason();
  static const regionAndCity = _RegionAndCities();
}

class _BaseUrls {
  _BaseUrls() {
    init();
    debugPrint('AppMode => ${EndPoints.appMode}');
    debugPrint('url => $url');
    debugPrint('url_laravel => $urlLaravel');
    debugPrint('urlimage => $urlImage');
    debugPrint('urlfile => $urlFile');
    debugPrint('urlfilelogo => $urlFileLogo');
  }

  late final String url;
  late final String urlLaravel;
  late final String urlImage;
  late final String urlFile;
  late final String urlFileLogo;
  late final String laravelFilesUrl;

  void init() {
    if (EndPoints.appMode.isProduction) {
      url = 'https://smartcrm.ws/crm/api/';
      urlLaravel = 'https://new.smartcrm.ws/api/';
      urlImage = 'https://smartcrm.ws/crm/api/imagesApp/profile/';
      urlFile = 'https://smartcrm.ws/crm/api/imagesApp/filesinvoice/';
      urlFileLogo = 'https://smartcrm.ws/crm/api/imagesApp/logoclient/';
      laravelFilesUrl = 'https://new.smartcrm.ws/storage/';
    } else {
      url = 'https://smartcrm.ws/test/api/';
      urlLaravel = 'https://test.smartcrm.ws/api/';
      urlImage = 'https://smartcrm.ws/test/api/imagesApp/profile/';
      urlFile = 'https://smartcrm.ws/test/api/imagesApp/filesinvoice/';
      urlFileLogo = 'https://smartcrm.ws/test/api/imagesApp/logoclient/';
      laravelFilesUrl = 'https://test.smartcrm.ws/storage/';
    }
  }
}

class _App {
  const _App();

  final getVersion = 'VersionUpdated/get_version.php';
}

class _Auth {
  const _Auth();

  final login = "checkEmail";
  final verifyOtp = "login";
  final validateToken = "isTokenAuthenticated";
}

class _Users {
  const _Users();

  final getUsers = 'users';
  final addUser = 'users';

  String updateUser(String idUser) => 'users/$idUser/edit';
  final allUsers = 'users/getUser.php';
  final getCurrentUser = 'GetCurrentUser';
  final getLevelsForUser = 'level-for-user';
  final getManagesForUser = 'admin-for-user';

  String getUsersByType(String usersType) => "users/$usersType";

  final String updateProfileImage = "users/update_picture.php";
  final String updateUserProfile = "users/update_user.php";
}

class _Links {
  const _Links();

  final getLink = 'getAllLink';
  final addLink = 'addLink';
  final updateLink = 'editLink/';
}

class _Company {
  const _Company();

  final getComment = 'getCommentsViaCompanyId/';
  final addComment = 'addCommentToCompany/';

  final String addCompany = 'addCompany';

  String updateCompany(idCompany) => 'updateCompany/$idCompany';
}

class _Series {
  const _Series();

  final getUsersSeries = 'series';
  final updateUsersSeries = 'series';
  final getWithdrawalsInvoices = 'series/getInvoice_Approve_back.php';
  final getSeriesInvoiceAll = 'getSeriesInvoiceAll';
  final getWithdrawalInvoiceDetails = 'series/view_series_invoice.php';
  final setApproveSeries = 'series/set_approve_series.php';
  final getWithdrawnDetails = 'series/view_detail_demand.php';
  final deleteDemandOut = 'series/delete_demand_out.php';

  String cancelWithdrawal(String idInvoice) => "cancelWithdrawInvoice/$idInvoice";

  String seriesApprove(String idInvoice) => "series/approve/$idInvoice";
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
  final getRecommendedClients = 'care/get_recommand_care.php';
  final String viewComments = "care/viewcomment.php";

  final String getClientsAccept = 'getClientsAccept';

  final String getCommunicationWithdrawalReasons = 'getReasonFrequent';
  final String previousRatings = 'newPreviousRatings';

  final String getGreetingCommunication = "communications/welcome";
  final String getInstall1 = 'communications/install1';
  final String getInstall2 = 'communications/install2';
  final String getPeriodicCommunication = "communications/frequent";
  final String getCareRate = 'communications/care-rate';
  final String getWrongNumbers = "communications/wrong-number";
  final String getNotUsingSystem = "communications/not-using-system";
  final String getActivitiesCare = "activities/care";
  final String getAllActivities = "activities";
  final String getActivityType = "activities/types";
  final String addActivity = "activities";
  final String getManagement = "admin-for-user";
  final String getViolationTypes = "violations/types";
  final String getActivitiesTypes = "activities/types";

  String updateActivity(String activityId) => "activities/$activityId/edit";

  String getActivityByClient(String clientId) => "activities/by-client/$clientId";

  String updateViolation(String violationId) => "violations/$violationId/edit";
  final String violations = "violations";
}

class _Privilege {
  const _Privilege();

  String getPrivileges(String levelId) => "privileges/$levelId";
  final updatePrivileges = "updatePermissions";
  final getLevels = "levels";
}

class _Client {
  const _Client();

  final similarClientsList = 'SimilarClientsNames';
  final clientsByRegionList = 'client/getclientByRegoin.php';
  final clientsByUserList = 'client/getclientbyuser.php';
  final contacts = 'contacts';
  final getClientFiles = 'clientFiles';

  String updateContacts(String contactId) => "contacts/$contactId/edit";
  final allClientsWithFilter = 'getAllClients';
  final addClient = 'addClient'; //'''client/clientAdd.php';
  final updateClient = "updateClient/"; // "client/clientUpdate.php";
  String editClientByTypeClient(String idClient) => "editClientByTypeClient/$idClient";
  final approveClientRejectAdmin = "clientAppproveAdmin/";
  final storeClientCommunication = "communication-details";

  String changeClientCommunication(String idClient) => "communication-details/$idClient/edit";
  final getRejectReasons = "reasons-reject";
  final addRejectReasons = "reasons-reject";

  String editRejectReasons(int id) => "reasons-reject/$id/edit";
  final distinctiveClient = "star_client/get_client_star.php";
  final transferClient = "transferClient/";
  final String approveRefuseTransferClient = "approveOrRefuseTransferClient/";
  final String getTransferClientsWithPrivileges = "getTransferClientsWithPrivileges";

  final String getClientLastComment = "getClientLastComment";

  String getClientDates(String idClient) {
    return "clientDates/$idClient";
  }

  String getInvoiceByIdClient(String idClient) {
    return "getInvoicesByClient/$idClient";
  }

  String getLinkClients(String idClient) {
    return "getLinkClient/$idClient";
  }

  String linkClientTo(String idClient) {
    return "linkClientTo/$idClient";
  }

  String setReadyInstall(String idInvoice) => "setReadyInstall/$idInvoice";
  final String getClientById = "getClientByID/";

  String receiveClient({required String idClient}) {
    return 'receiveClient/$idClient';
  }

  final String subscribedClients = "subscribedClients";

  final String exceededClients = "exceededClients";
  final String transferExceededClients = "transferExceededClients";
  final String getClientsDebts = "invoiceDebt";
  final String highSimilarClients = "highSimilarClientsNames";

  String getClientLogs(String idClient) {
    return "change-log/$idClient";
  }
}

class _Task {
  const _Task();

  final addTask = 'addTask';
  final filterTasksByAll = 'filterTaskesByAll';
  final changeStatusTask = 'changeStatuseTask/';
  final getUsersByTypeAdministrationAndRegion = 'getUsersByTypeAdministrationAndRegion';
}

class _Participate {
  const _Participate();

  final getParticipates = 'participates';
  final allParticipates = 'agent/get_participate.php';
  final addParticipate = 'participates';

  String updateParticipate(String participateId) => 'participates/$participateId/edit';

  final allParticipateClients = 'getParticipateClints';
  final allParticipateInvoices = 'getParticipateInvoices';
  final getInvoiceById = 'client/invoice/getInvoiceID.php';
  final allParticipateComments = 'getParticipateComments';
  final addParticipateComment = 'addCommentParticipate';

  String changeParticipateStatus(String idParticipate) {
    return "participates/$idParticipate/change-status";
  }
}

class _City {
  const _City();

  final String getBranches = "branch-for-user";
  final String getAllCities = 'cities';
  final String getCitiesFromMainCitiesIds = 'getCitiesFromMainCitiesIds';

  String getRegions(String fkCountry) => 'main-city/$fkCountry';
}

class _AgentDistributor {
  const _AgentDistributor();

  final String getAgentsAndDistributors = 'agents';
  final String getAgentClients = 'getAgentClints/';
  final String getAgentById = 'agent/get_agent_byId.php';
  final String getAgentInvoicesList = 'getAgentInvoices/';
  final String getAgentCommentsList = 'getAgentComments/';
  final String addCommentAgent = 'addCommentAgent';
  final String getDateVisitAgent = 'getDateVisitAgent/';
  final String addAgentDate = 'client/invoice/add_date_install.php';
  final String addAgent = 'agents';

  final String waitingTrainingAgents = 'agents/wait-training';

  String updateAgent(String id) => 'agents/$id/edit';

  String changeStateAgent(String id) => 'agents/$id/change-state';

  String doneTraining(String id) => 'agents/$id/done-training';

  String crudAgentSupportFiles(String id) => 'agents/$id/crud-files';
}

class _Invoice {
  const _Invoice();

  // ?type_seller=1&fk_regoin_invoice=11&TypeReadyClient&from&to&search_query&fk_agent&participate_fk&fk_idUser
  final String getInvoicesByPrivileges = 'getInvoicesByPrivilages';

  final String clientUpdateInvoice = 'client/invoice/updateinvoice.php';

  final String crudFilesInvoice = 'FilesInvoice/crud_files_invoice.php?fk_invoice=';

  final String getClientSupportFiles = 'getFilesInvoices';
  final String crudClientSupportFiles = 'InvoiceFiles';

  final String setDateInstall = 'setDateInstall/';
  final String updateCommunication = 'updateCommunication';
  final String deleteInvoice = 'deleteInvoice/';
  final String addInvoice = 'addInvoice';
  final String updateInvoice = 'updateInvoice/';
  final String crudFileInvoice = 'crudFileInvoice/';
  final String getInvoiceMainCity = 'getInvoiceMainCity';

  // final String updateInvoiceState = 'client/invoice/update_stateback.php';
  final String pendingApproveAdmin = 'pendingInvoicesApprove';
  final String getPendingApproveFinance = 'financePendingInvoices';
  final String getwithdrawInvoices = 'withdrawInvoices';
  final String getdeletedInvoices = 'deletedInvoices';

  String withdrawInvoices(String id) => 'withdrawInvoice/$id';

  String setApproveInvoice(String idInvoice) {
    return 'setApproveInvoice/${idInvoice}';
  }

  String returnToApprove(String idInvoice) {
    return 'cancelApproveInvoice/${idInvoice}';
  }

  String changeDeviceState(String idInvoice) {
    return 'changeDeviceState/${idInvoice}';
  }

  String cancelDateInstall(idInvoice) => "cancelDateInstall/$idInvoice";

  String getInvoiceById(String invoiceId) => 'getInvoiceById/$invoiceId';
}

class _Tickets {
  const _Tickets();

  final String getCategoriesTicket = 'getCategoriesTicket';
  final String getSubCategoriesTicket = 'getSubCategoriesTicket';

  final String getTickets = 'getTickets';
  final String getClientTicket = 'getTicketByIdClinet/';
  final String getTicketById = 'getTicketById/';
  final String editTicketType = 'editTicketType/';
  final String addTicket = 'addTicket';
  final String transferTicket = 'TransferTicket/';
}

class _Events {
  const _Events();

  String updateStatusForVisit(String scheduleId) => 'updateStatusForVisit/$scheduleId';
  final String addDateInstall = "addDateInstall";

  String rescheduleOrCancelVisitClient(String scheduleId) => "rescheduleOrCancelVisitClient/$scheduleId";

  String returnScheduleVisitToOpen(String scheduleId) => "returnScheduleVisitToOpen/$scheduleId";

  final String getInstallDate = "getInstallDate";

  String getInvoicesByClientForDate(idClient) {
    return "getInvoicesByClientForDate/$idClient";
  }

  final String getCancelReasons = "reasonCancelDate";
}

class _Configs {
  const _Configs();

  final String getAdvancedConfigs = "configs/advanced";
  final String editAdvancedConfigs = "configs/advanced";
  final String getGeneralConfigs = "configs/normal";
  final String editGeneralConfigs = "configs/normal";
}

class _Support {
  const _Support();

  final String getSupportClientsAccept = 'getClientFilterAccept';

  String getDateTimelinesByEmployee(idClient) {
    return "userDateFree/$idClient";
  }
}

class _Reports {
  const _Reports();

  final String getClientMarketingReport = "clientMarketingReport";

  final String getDelayInstallReports = 'reports/report_delay_install.php';
  final String getDelayAfterInstall = 'reports/delayafterinstall.php';

  final String getEmployeesSalesReports = 'reports/reportsales.php';
  final String getRegionsSalesReports = 'reports/reportsalesRegoin.php';
  final String getProductsSalesReports = 'reports/sales_product.php';
  final String getClientsDebtsReports = 'reports/debt_report.php';
  final String getClientsStatusReports = 'reports/sales_statereport.php';
  final String getClientsInstallReports = 'reports/support_report_install.php';
  final String getClientsCareReports = 'reports/care_report.php';
  final String getEvaluationLevelReport = 'reports/report_care_rate.php';
  final String getPeriodicCommunicationReports = "reports/care_communication_report.php";
}

class _Notifications {
  const _Notifications();

  final String getNotifications = 'notifications';
  final String markNotificationsAsRead = 'notifications/mark-read';
  final String getUnreadNotificationsCount = 'notifications/count-unread';
}

class _Versions {
  const _Versions();

  final String getAllVersions = 'version-features';
  final String addVersions = 'version-features';

  String updateVersions(int id) => 'version-features/$id/edit';
}

class _Products {
  const _Products();

  final String addProduct = 'products';

  String updateProduct(int id) => 'products/$id/edit';

  String deleteProduct(int id) => 'products/$id/delete';
}

class _Management {
  const _Management();

  final String getManagement = 'managements';
  final String addManagement = 'managements';

  String updateManagement(int id) => 'managements/$id/edit';
}

class _Reason {
  const _Reason();

  final String getReason = 'reasons-out';
  final String addReason = 'reasons-out';

  String updateReason(int id) => 'reasons-out/$id/edit';
}

class _RegionAndCities {
  const _RegionAndCities();

  String getRegion(String id) => 'main-city/$id';

  String addRegion(String id) => 'main-city/$id';

  String updateRegion(String id) => 'main-city/$id/edit';
  final String getCities = 'cities';
  final String addCities = 'cities';
  String updateCities(String id) => 'cities/$id/edit';
}
