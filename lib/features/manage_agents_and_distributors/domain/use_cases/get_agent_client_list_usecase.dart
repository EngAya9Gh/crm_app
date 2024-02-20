import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repositories/agents_distributors_profile_repo.dart';

@injectable
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

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_agent': agentId};
}
