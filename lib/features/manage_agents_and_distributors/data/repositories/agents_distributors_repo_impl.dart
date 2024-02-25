import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/agent_distributor_model.dart';
import '../../domain/repositories/agents_distributors_repo.dart';
import '../data_sources/remote_data_source/agents_distributors_data_source.dart';

@LazySingleton(as: AgentsDistributorsRepo)
class AgentsDistributorsRepoImpl extends AgentsDistributorsRepo {
  final AgentsDistributorsDataSource dataSource;

  AgentsDistributorsRepoImpl(this.dataSource);

  @override
  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors() {
    return dataSource.getAgentsAndDistributors();
  }
}
