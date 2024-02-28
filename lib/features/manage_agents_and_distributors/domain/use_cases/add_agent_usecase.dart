import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../data/models/agent_distributor_action_model.dart';
import '../repositories/agents_distributors_actions_repo.dart';

@lazySingleton
class AddAgentUseCase extends UseCase<Either<String, void>, AddAgentParams> {
  AddAgentUseCase(this.repository);

  final AgentsDistributorsActionsRepo repository;

  @override
  Future<Either<String, void>> call(AddAgentParams params) {
    return repository.addAgent(addAgentParams: params);
  }
}

class AddAgentParams {
  final AgentDistributorActionModel agentActionModel;
  final File? file;
  final File? filelogo;
  final List<File>? files;

  AddAgentParams({
    required this.agentActionModel,
    this.file,
    this.filelogo,
    this.files,
  });
}
