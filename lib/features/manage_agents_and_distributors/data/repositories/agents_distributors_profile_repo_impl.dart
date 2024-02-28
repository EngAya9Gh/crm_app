import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../model/invoiceModel.dart';
import '../../domain/repositories/agents_distributors_profile_repo.dart';
import '../data_sources/remote_data_source/agents_distributors_profile_data_source.dart';

@LazySingleton(as: AgentsDistributorsProfileRepo)
class AgentsDistributorsProfileRepoImpl
    implements AgentsDistributorsProfileRepo {
  final AgentsDistributorsProfileDataSource datasource;

  AgentsDistributorsProfileRepoImpl(this.datasource);

  @override
  Future<Either<String, List<ClientModel>>> getAgentsClientsList({
    required String agentId,
  }) {
    return datasource.getAgentClientsList(agentId: agentId);
  }

  @override
  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoicesList({
    required String agentId,
  }) {
    return datasource.getAgentInvoiceList(agentId: agentId);
  }

  @override
  Future<Either<String, List<ProfileCommentModel>>> getParticipateCommentsList({
    required String agentId,
  }) {
    return datasource.getAgentCommentsList(agentId: agentId);
  }

  @override
  Future<Either<String, ProfileCommentModel>> addAgentComment({
    required String agentId,
    required String content,
  }) {
    return datasource.addAgentComment(agentId: agentId, content: content);
  }

  @override
  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  }) {
    return datasource.getDateVisitAgent(agentId: agentId);
  }

  @override
  Future<Either<String, void>> addAgentDate({
    required DateInstallationClient agentDateModel,
  }) {
    return datasource.addAgentDate(agentDateModel: agentDateModel);
  }

  @override
  Future<Either<String, AgentDistributorModel>> getAgentByID(
      {required String agentId}) {
    // TODO: implement getAgentByID
    return datasource.getAgentById(agentId: agentId);
  }

  @override
  Future<Either<String, AgentDistributorModel>> doneTraining(
      {required String agentId, required String fkuser}) {
    return datasource.doneTraining(agentId: agentId, fkUser: fkuser);
  }
}
