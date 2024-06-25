import 'package:dartz/dartz.dart';

import '../../../../../model/agent_distributor_model.dart';
import '../use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsRepo {
  Future<Either<String, List<AgentDistributorModel>>> getWaitingAgents(
    GetWaitingAgentsParams params,
  );
}
