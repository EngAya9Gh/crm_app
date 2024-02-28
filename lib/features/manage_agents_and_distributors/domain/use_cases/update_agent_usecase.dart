import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../data/models/agent_distributor_action_model.dart';
import '../repositories/agents_distributors_actions_repo.dart';

@lazySingleton
class UpdateAgentUseCase
    extends UseCase<Either<String, void>, UpdateAgentParams> {
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
  final File? file;
  final List<File>? files;

  UpdateAgentParams({
    required this.agentId,
    required this.agentActionModel,
    this.file,
    this.files,
  });
}
