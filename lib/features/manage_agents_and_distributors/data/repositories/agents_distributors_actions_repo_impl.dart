import 'package:crm_smart/features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/agents_distributors_actions_repo.dart';
import '../data_sources/remote_data_source/agents_distributors_actions_data_source.dart';

@LazySingleton(as: AgentsDistributorsActionsRepo)
class AgentsDistributorsActionsRepoImpl extends AgentsDistributorsActionsRepo {
  final AgentsDistributorsActionsDataSource agentsDistributorsActionsDataSource;

  AgentsDistributorsActionsRepoImpl(this.agentsDistributorsActionsDataSource);

  @override
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
    String? regionId,
  }) async {
    return await agentsDistributorsActionsDataSource.getAllCities(
      fkCountry: fkCountry,
    );
  }

  @override
  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  }) {
    return agentsDistributorsActionsDataSource.addAgent(
      addAgentParams: addAgentParams,
    );
  }
}
