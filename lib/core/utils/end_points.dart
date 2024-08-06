import 'package:flutter/foundation.dart' show debugPrint;

import '../common/enums/enums.dart';

abstract class EndPoints {
  EndPoints._();

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
}

class _BaseUrls {
  static AppMode appMode = AppMode.development;

  _BaseUrls() {
    init();
    debugPrint('AppMode => $appMode');
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
    if (appMode == AppMode.production) {
      url = 'http://smartcrm.ws/crm/api/';
      urlLaravel = 'http://new.smartcrm.ws/api/';
      urlImage = 'http://smartcrm.ws/crm/api/imagesApp/profile/';
      urlFile = 'http://smartcrm.ws/crm/api/imagesApp/filesinvoice/';
      urlFileLogo = 'http://smartcrm.ws/crm/api/imagesApp/logoclient/';
      laravelFilesUrl = 'http://new.smartcrm.ws/storage/';
    } else {
      url = 'http://smartcrm.ws/test/api/';
      urlLaravel = 'http://test.smartcrm.ws/api/';
      urlImage = 'http://smartcrm.ws/test/api/imagesApp/profile/';
      urlFile = 'http://smartcrm.ws/test/api/imagesApp/filesinvoice/';
      urlFileLogo = 'http://smartcrm.ws/test/api/imagesApp/logoclient/';
      laravelFilesUrl = 'http://test.smartcrm.ws/storage/';
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
  final getBranchesForUser = 'branch-for-user';
  final getLevelsForUser = 'level-for-user';
  final getManagesForUser = 'admin-for-user';
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
}

class _Series {
  const _Series();

  final getUsersSeries = 'series/view_series_manag.php';
  final updateUsersSeries = 'series/update_series_manage.php';
  final getWithdrawalsInvoices = 'series/getInvoice_Approve_back.php';
  final getSeriesInvoiceAll = 'getSeriesInvoiceAll';
  final getWithdrawalInvoiceDetails = 'series/view_series_invoice.php';
  final setApproveSeries = 'series/set_approve_series.php';
  final getWithdrawnDetails = 'series/view_detail_demand.php';
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
  final getRecommendedClients = 'care/get_recommand_care.php';
  final String viewComments = "care/viewcomment.php";

  final String getClientsAccept = 'getClientsAccept';

  final String getInstall1 = 'care/get_install_1.php';
  final String getInstall2 = 'care/get_install2.php';
  final String getCommunicationWithdrawalReasons = 'getReasonFrequent';
}

class _Privilege {
  const _Privilege();

  final getPrivileges = "privilge/privGet.php";
  final updatePrivileges = "updatePermissions";
  final getLevels = "config/getLevel.php";
  final addLevel = "privilge/privAdd.php";
}

class _Client {
  const _Client();

  final similarClientsList = 'SimilarClientsNames';
  final clientsByRegionList = 'client/getclientByRegoin.php';
  final clientsByUserList = 'client/getclientbyuser.php';
  final allClientsWithFilter = 'getAllClients';
  final addClient = 'addClient'; //'''client/clientAdd.php';
  final updateClient = "updateClient/"; // "client/clientUpdate.php";
  String editClientByTypeClient(String idClient) =>
      "editClientByTypeClient/$idClient";
  final approveClientRejectAdmin = "clientAppproveAdmin/";
  final getRejectReasons =
      "client/reason_client_reject/Get_reasonRejectClient.php";
  final addRejectReasons =
      "client/reason_client_reject/Add_reasonRejectClient.php";
  final editRejectReasons =
      "client/reason_client_reject/Edit_reasonRejectClient.php";
  final distinctiveClient = "star_client/get_client_star.php";
  final transferClient = "transferClient/";
  final String approveRefuseTransferClient = "approveOrRefuseTransferClient/";
  final String getTransferClientsWithPrivileges =
      "getTransferClientsWithPrivileges";

  final String getClientLastComment = "getClientLastComment";

  String getInvoiceByIdClient(String idClient) {
    return "getInvoicesByClient/$idClient";
  }

  final String setReadyInstall = "client/invoice/set_ready_install.php";
  final String getClientById = "getClientByID/";

  String receiveClient({required String idClient}) {
    return 'receiveClient/$idClient';
  }

  final String subscribedClients = "subscribedClients";

  final String exceededClients = "exceededClients";
  final String transferExceededClients = "transferExceededClients";
  final String getClientsDebts = "invoiceDebt";
}

class _Task {
  const _Task();

  final addTask = 'addTask';
  final filterTasksByAll = 'filterTaskesByAll';
  final changeStatusTask = 'changeStatuseTask/';
  final getUsersByTypeAdministrationAndRegion =
      'getUsersByTypeAdministrationAndRegion';
}

class _Participate {
  const _Participate();

  final getParticipates = 'participates';
  final allParticipates = 'agent/get_participate.php';
  final addParticipate = 'participates';

  String updateParticipate(String participateId) =>
      'participates/$participateId/edit';

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

  final String getRegionsByIdCountry = "country/get_regoinByIdCountry.php";
  final String getAllCities = 'config/getcity.php?fk_country=';
  final String getCitiesFromMainCitiesIds = 'getCitiesFromMainCitiesIds';
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

  final String crudFilesInvoice =
      'FilesInvoice/crud_files_invoice.php?fk_invoice=';

  final String getClientSupportFiles = 'getFilesInvoices';
  final String crudClientSupportFiles = 'InvoiceFiles';

  final String setDateInstall = 'setDateInstall/';
  final String updateCommunication = 'updateCommunication';
  final String deleteInvoice = 'deleteInvoice/';
  final String addInvoice = 'addInvoice';
  final String updateInvoice = 'updateInvoice/';
  final String crudFileInvoice = 'crudFileInvoice/';
  final String getInvoiceMainCity = 'getInvoiceMainCity';
  final String updateInvoiceState = 'client/invoice/update_stateback.php';
  final String pendingApproveAdmin = 'pendingInvoicesApprove';
  final String getPendingApproveFinance = 'financePendingInvoices';
  final String getwithdrawInvoices = 'withdrawInvoices';
  final String getdeletedInvoices = 'deletedInvoices';

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

  String updateStatusForVisit(String scheduleId) =>
      'updateStatusForVisit/$scheduleId';
  final String addDateInstall = "addDateInstall";

  String rescheduleOrCancelVisitClient(String scheduleId) =>
      "rescheduleOrCancelVisitClient/$scheduleId";

  String returnScheduleVisitToOpen(String scheduleId) =>
      "returnScheduleVisitToOpen/$scheduleId";

  final String getInstallDate = "getInstallDate";

  String getInvoicesByClientForDate(idClient) {
    return "getInvoicesByClientForDate/$idClient";
  }
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

  final String getSupportClientsAccept = 'client/getclientfilteraccept.php';
}

class _Reports {
  const _Reports();

  final String getClientMarketingReport = "clientMarketingReport";

  final String getDelayInstallReports = 'reports/report_delay_install.php';
  final String getDelayAfterInstall = 'reports/delayafterinstall.php';
}
