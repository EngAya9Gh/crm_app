import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/agent_distributor_action_model.dart';
import '../repositories/agents_distributors_actions_repo.dart';

@lazySingleton
class UpdateAgentUseCase
    extends BaseUsecase<Either<String, void>, UpdateAgentParams> {
  UpdateAgentUseCase(this.repository);

  final AgentsDistributorsActionsRepo repository;

  @override
  Future<Either<String, void>> call(UpdateAgentParams params) {
    return repository.updateAgent(updateAgentParams: params);
  }
}

class UpdateAgentParams {
  final String agentId;
  final AgentDistributorActionModel agentActionModel;

  const UpdateAgentParams({
    required this.agentId,
    required this.agentActionModel,
  });
}
