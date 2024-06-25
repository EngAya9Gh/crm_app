import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsRepo {
  Future<Either<String, List<AgentDistributorModel>>> getWaitingAgents(
    GetWaitingAgentsParams params,
  );
}
