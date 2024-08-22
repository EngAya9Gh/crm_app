import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../repositories/waiting_agents_repo.dart';

@lazySingleton
class GetWaitingAgentsUsecase extends BaseUsecase<
    Either<String, List<AgentDistributorModel>>, GetWaitingAgentsParams> {
  GetWaitingAgentsUsecase(this._repository);

  final WaitingAgentsRepo _repository;

  @override
  Future<Either<String, List<AgentDistributorModel>>> call(
    GetWaitingAgentsParams params,
  ) async {
    return await _repository.getWaitingAgents(params);
  }
}

class GetWaitingAgentsParams {
  const GetWaitingAgentsParams();
}
