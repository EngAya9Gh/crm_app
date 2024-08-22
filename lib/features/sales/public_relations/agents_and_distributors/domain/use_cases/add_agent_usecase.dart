import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/agent_distributor_action_model.dart';
import '../../data/models/agent_distributor_model.dart';
import '../repositories/agents_distributors_actions_repo.dart';

@lazySingleton
class AddAgentUseCase
    extends BaseUsecase<Either<String, void>, AddAgentParams> {
  AddAgentUseCase(this.repository);

  final AgentsDistributorsActionsRepo repository;

  @override
  Future<Either<String, AgentDistributorModel>> call(AddAgentParams params) {
    return repository.addAgent(addAgentParams: params);
  }
}

class AddAgentParams {
  final AgentDistributorActionModel agentActionModel;

  AddAgentParams({
    required this.agentActionModel,
  });
}
