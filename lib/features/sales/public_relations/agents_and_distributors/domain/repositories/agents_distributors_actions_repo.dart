import 'package:dartz/dartz.dart';

import '../../data/models/agent_distributor_model.dart';
import '../use_cases/add_agent_usecase.dart';
import '../use_cases/update_agent_usecase.dart';

abstract class AgentsDistributorsActionsRepo {
  Future<Either<String, AgentDistributorModel>> addAgent({
    required AddAgentParams addAgentParams,
  });

  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  });
}
