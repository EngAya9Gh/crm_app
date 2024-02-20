import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../common/models/profile_invoice_model.dart';
import '../../domain/repositories/agents_distributors_profile_repo.dart';
import '../data_sources/remote_data_source/agents_distributors_profile_data_source.dart';

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
}
