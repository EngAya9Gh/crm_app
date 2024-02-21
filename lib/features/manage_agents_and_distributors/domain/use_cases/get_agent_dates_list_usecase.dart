import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/models/agent_date_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repositories/agents_distributors_profile_repo.dart';

@injectable
class GetAgentDatesListUsecase extends UseCase<
    Either<String, List<AgentDateModel>>, GetAgentDatesListParams> {
  GetAgentDatesListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<AgentDateModel>>> call(
      GetAgentDatesListParams params) {
    return repository.getDateVisitAgent(agentId: params.agentId!);
  }
}

class GetAgentDatesListParams {
  final String? agentId;

  GetAgentDatesListParams({this.agentId});
}
