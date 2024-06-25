import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/agent_distributor_model.dart';
import '../repositories/agents_distributors_repo.dart';

@lazySingleton
class GetAgentsAndDistributorsUseCase extends UseCase<
    Either<String, List<AgentDistributorModel>>,
    GetAgentsAndDistributorsParams> {
  final AgentsDistributorsRepo repository;

  GetAgentsAndDistributorsUseCase(this.repository);

  @override
  Future<Either<String, List<AgentDistributorModel>>> call(
    GetAgentsAndDistributorsParams params,
  ) {
    return repository.getAgentsAndDistributors(params);
  }
}

class GetAgentsAndDistributorsParams {
  String? searchQuery;
  String? agentState;
  String? agentSource;

  GetAgentsAndDistributorsParams({
    this.searchQuery,
    this.agentState,
    this.agentSource,
  });

  GetAgentsAndDistributorsParams copyWith({
    String? searchQuery,
    String? agentState,
    String? agentSource,
  }) {
    return GetAgentsAndDistributorsParams(
      searchQuery: searchQuery ?? this.searchQuery,
      agentState: agentState ?? this.agentState,
      agentSource: agentSource ?? this.agentSource,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'search_query': searchQuery,
      'state': agentState,
      'source': agentSource,
    };
  }
}
