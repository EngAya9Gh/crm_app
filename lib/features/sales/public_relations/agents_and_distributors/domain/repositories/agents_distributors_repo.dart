import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../model/agent_distributor_model.dart';

abstract class AgentsDistributorsRepo {
  Future<Either<String, List<AgentDistributorModel>>> getAgentsAndDistributors(
    GetAgentsAndDistributorsParams params,
  );

  Future<Either<String, dynamic>> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  });
}
