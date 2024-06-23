import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/services/api/api_services.dart';
import '../../../../../../../core/utils/end_points.dart';

abstract class AgentsDistributorsDataSource {
  Future<dynamic> getAgentsAndDistributors(
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

  Future<dynamic> getAgentsAndDistributors(
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
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("Error in getAgentsAndDistributors: ${e.message}");
      throw e.message;
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
