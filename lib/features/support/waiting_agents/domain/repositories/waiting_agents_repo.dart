import 'package:dartz/dartz.dart';

import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsRepo {
  Future<Either<String, List<AgentDistributorModel>>> getWaitingAgents(
    GetWaitingAgentsParams params,
  );
}
