import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentClientListUsecase extends BaseUsecase<
    Either<String, List<ClientModel>>, GetAgentClientListParams> {
  GetAgentClientListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<ClientModel>>> call(
      GetAgentClientListParams params) {
    return repository.getAgentsClientsList(agentId: params.agentId!);
  }
}

class GetAgentClientListParams {
  final String? agentId;

  GetAgentClientListParams({this.agentId});
}
