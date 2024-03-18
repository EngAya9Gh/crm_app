import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/agent_distributor_model.dart';

abstract class AgentsDistributorsDataSource {
  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors();
}

@LazySingleton(as: AgentsDistributorsDataSource)
class AgentsDistributorsDataSourceImpl extends AgentsDistributorsDataSource {
  AgentsDistributorsDataSourceImpl(this.api);

  final ApiServices api;

  Future<Either<String, List<AgentDistributorModel>>>
      getAgentsAndDistributors() async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final String endPoint =
          EndPoints.agentDistributor.getAgentsAndDistributors;
      final result = await api.get(endPoint: endPoint);
      final List data = result["message"] ?? [];
      final List<AgentDistributorModel> agents = [];

      for (var agent in data) {
        agents.add(AgentDistributorModel.fromJson(agent));
      }

      return right(agents);
    } catch (e) {
      return left(e.toString());
    }
  }
}
