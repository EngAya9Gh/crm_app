import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/agent_distributor_model.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentByIdUsecase extends BaseUsecase<
    Either<String, AgentDistributorModel>, GetAgentByIdParams> {
  GetAgentByIdUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, AgentDistributorModel>> call(
    GetAgentByIdParams params,
  ) {
    return repository.getAgentByID(agentId: params.agentId);
  }
}

class GetAgentByIdParams {
  final String agentId;

  const GetAgentByIdParams({required this.agentId});
}
