abstract class EndPoints {
  EndPoints._();

  static const phpUrl = "http://smartcrm.ws/test/api/";
  static const String laravelUrl = 'http://test.smartcrm.ws/api/';
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
}

class _App {
  const _App();

  final getVersion = 'VersionUpdated/get_version.php';
}

class _Users {
  const _Users();

  final allUsers = 'users/getUser.php';
  final addUser = 'users/addUser.php';
  final updateUser = 'users/updateuser_patch.php';
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

  final allClientsList = 'client/getClientAll.php';
  final similarClientsList = 'SimilarClientsNames';
  final clientsByRegionList = 'client/getclientByRegoin.php';
  final clientsByUserList = 'client/getclientbyuser.php';
  final allClientsWithFilter = 'client/getclientAll_filter.php';
  final addClient = 'client/clientAdd.php';
  final editClient = "client/clientUpdate.php";
  final changeTypeClient = "editClientByTypeClient/";
  final approveClient_reject_admin = "clientAppproveAdmin/";
  final getRejectReasons =
      "client/reason_client_reject/Get_reasonRejectClient.php";
  final addRejectReasons =
      "client/reason_client_reject/Add_reasonRejectClient.php";
  final editRejectReasons =
      "client/reason_client_reject/Edit_reasonRejectClient.php";
  final distinctiveClient = "star_client/get_client_star.php";
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

  final allParticipates = 'agent/get_participate.php';
  final addParticipate = 'agent/addparticipate.php';
  final updateParticipate = 'agent/update_participate.php';

  final allParticipateClients = 'getParticipateClints';
  final allParticipateInvoices = 'getParticipateInvoices';
  final IvoiceByID = 'client/invoice/getInvoiceID.php';
  final allParticipateComments = 'getParticipateComments';
  final addParticipateComment = 'addCommentParticipate';
}

class _City {
  const _City();

  final String getAllCities = 'config/getcity.php?fk_country=';
  final String getCitiesFromMainCitiesIds = 'getCitiesFromMainCitiesIds';
}

class _AgentDistributor {
  const _AgentDistributor();

  final String getAgentsAndDistributors = 'agent/get_agent.php';
  final String getAgentClients = 'getAgentClints/';
  final String getAgentById = 'agent/get_agent_byId.php';
  final String getAgentInvoicesList = 'getAgentInvoices/';
  final String getAgentCommentsList = 'getAgentComments/';
  final String addCommentAgent = 'addCommentAgent';
  final String getDateVisitAgent = 'getDateVisitAgent/';
  final String addAgentDate = 'client/invoice/add_date_install.php';
  final String doneTraining = 'agent/done_training.php';
  final String addAgent = 'agent/add_agent.php';
  final String updateAgent = 'agent/update_agent.php?id_agent=';
}

class _Invoice {
  const _Invoice();

  final String clientUpdateInvoice = 'client/invoice/updateinvoice.php';

  final String crudFilesInvoice =
      'FilesInvoice/crud_files_invoice.php?fk_invoice=';

  final String getClientSupportFiles = 'getFilesInvoices';
  final String crudClientSupportFiles = 'InvoiceFiles';
}
