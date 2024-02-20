import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:dartz/dartz.dart';

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
    final data = datasource.getAgentClientsList(agentId: agentId);
    print("data is =>> $data");
    return datasource.getAgentClientsList(agentId: agentId);
  }
// Future<Result<ResponseWrapper<List<ParticipateInvoiceModel>>>>
//     getParticipateInvoicesList(String participateId);
//
// Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(
//     Map<String, dynamic> params);
//
// Future<Result<ResponseWrapper<List<ParticipateCommentModel>>>>
//     getParticipateCommentsList(String participateId);
//
// Future<Result<ResponseWrapper<ParticipateCommentModel>>> addCompanyComment(
//     Map<String, dynamic> body);
}
