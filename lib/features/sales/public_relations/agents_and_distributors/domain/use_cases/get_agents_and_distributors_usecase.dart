import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/agent_distributor_model.dart';
import '../repositories/agents_distributors_repo.dart';

@lazySingleton
class GetAgentsAndDistributorsUseCase extends BaseUsecase<
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
  final String? searchQuery;
  final String? agentState;
  final String? agentSource;
  final String? cityId;

  const GetAgentsAndDistributorsParams({
    this.searchQuery,
    this.agentState,
    this.agentSource,
    this.cityId,
  });

  GetAgentsAndDistributorsParams copyWith({
    String? searchQuery,
    String? agentState,
    String? agentSource,
    String? cityId,
  }) {
    return GetAgentsAndDistributorsParams(
      searchQuery: searchQuery ?? this.searchQuery,
      agentState: agentState ?? this.agentState,
      agentSource: agentSource ?? this.agentSource,
      cityId: cityId ?? this.cityId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'search_query': searchQuery,
      'state': agentState,
      'source': agentSource,
      'cityId': cityId,
    };
  }
}
