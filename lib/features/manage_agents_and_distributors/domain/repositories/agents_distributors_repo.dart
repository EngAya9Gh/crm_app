import 'package:dartz/dartz.dart';

import '../../../../model/agent_distributor_model.dart';

abstract class AgentsDistributorsRepo {
  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors();
}
