import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../data/models/agent_distributor_model.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class DoneTrainingUsecase
    extends UseCase<Either<String, AgentDistributorModel>, DoneTrainingParams> {
  DoneTrainingUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, AgentDistributorModel>> call(
    DoneTrainingParams params,
  ) {
    return repository.doneTraining(
      agentId: params.agentId,
    );
  }
}

class DoneTrainingParams {
  final String agentId;

  DoneTrainingParams({
    required this.agentId,
  });
}
