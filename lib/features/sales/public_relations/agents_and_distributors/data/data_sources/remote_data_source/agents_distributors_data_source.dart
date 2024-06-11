import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/services/api/api_services.dart';
import '../../../../../../../core/utils/end_points.dart';
import '../../../../../../../model/agent_distributor_model.dart';

abstract class AgentsDistributorsDataSource {
  Future<Either<String, List<AgentDistributorModel>>> getAgentsAndDistributors(
    GetAgentsAndDistributorsParams params,
  );

  Future<dynamic> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  });
}

@LazySingleton(as: AgentsDistributorsDataSource)
class AgentsDistributorsDataSourceImpl extends AgentsDistributorsDataSource {
  AgentsDistributorsDataSourceImpl(this.api);

  final ApiServices api;

  Future<Either<String, List<AgentDistributorModel>>> getAgentsAndDistributors(
    GetAgentsAndDistributorsParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final String endPoint =
          EndPoints.agentDistributor.getAgentsAndDistributors;
      final response = await api.get(
        endPoint: endPoint,
        queryParameters: params.toMap(),
      );
      final data = apiDataHandler(response);
      final List<AgentDistributorModel> agents = [];

      for (var agent in data) {
        agents.add(AgentDistributorModel.fromJson(agent));
      }

      return right(agents);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<dynamic> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  }) async {
    try {
      final endPoint = EndPoints.agentDistributor.changeStateAgent(
        changeStateAgentParams.agentId,
      );
      final response = await api.post(
        endPoint: endPoint,
        data: changeStateAgentParams.toMap(),
      );

      final data = apiDataHandler(response);

      return data;
    } on BaseAppException catch (e) {
      debugPrint("Error in changeStateAgent: ${e.message}");
      throw e.message;
    }
  }
}
