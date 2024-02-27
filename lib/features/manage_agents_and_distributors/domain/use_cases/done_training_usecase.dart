import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../../model/agent_distributor_model.dart';

@lazySingleton
class DoneTrainingUsecase extends UseCase<
    Either<String, AgentDistributorModel>, DoneTrainingParams> {
  DoneTrainingUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, AgentDistributorModel>> call(
      DoneTrainingParams params,
      ) {
    return repository.doneTraining(
      agentId: params.agentId,
      fkuser: params.fkuser_training,
    );
  }
}

class DoneTrainingParams {
  final String agentId;
  final String fkuser_training;

  DoneTrainingParams({
    required this.agentId,
    required this.fkuser_training,
  });
}
