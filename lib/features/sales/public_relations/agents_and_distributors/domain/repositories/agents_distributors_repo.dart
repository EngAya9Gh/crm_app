import 'package:dartz/dartz.dart';

import '../../data/models/agent_distributor_model.dart';
import '../use_cases/change_state_agent_usecase.dart';
import '../use_cases/get_agents_and_distributors_usecase.dart';

abstract class AgentsDistributorsRepo {
  Future<Either<String, List<AgentDistributorModel>>> getAgentsAndDistributors(
    GetAgentsAndDistributorsParams params,
  );

  Future<Either<String, dynamic>> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  });
}
