import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsRepo {
  Future<Either<String, ResponseWrapper<List<AgentDistributorModel>>>> getWaitingAgents(
    GetWaitingAgentsParams params,
  );
}
