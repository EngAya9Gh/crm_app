import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../clients_list/data/models/clients_list_response.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentClientListUsecase extends UseCase<
    Either<String, List<ClientModel>>, GetAgentClientListParams> {
  GetAgentClientListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<ClientModel>>> call(
      GetAgentClientListParams params) {
    final data = repository.getAgentsClientsList(agentId: params.agentId!);
    return repository.getAgentsClientsList(agentId: params.agentId!);
  }
}

class GetAgentClientListParams {
  final String? agentId;

  GetAgentClientListParams({this.agentId});
}
