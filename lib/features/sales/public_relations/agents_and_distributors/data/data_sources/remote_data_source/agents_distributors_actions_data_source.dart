import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../../core/services/api/api_services.dart';
import '../../../../../../../core/utils/end_points.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';
import '../../../domain/use_cases/update_agent_usecase.dart';

abstract class AgentsDistributorsActionsDataSource {
  Future<dynamic> addAgent({
    required AddAgentParams addAgentParams,
  });

  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  });
}

@LazySingleton(as: AgentsDistributorsActionsDataSource)
class AgentsDistributorsActionsDataSourceImpl
    extends AgentsDistributorsActionsDataSource {
  final ApiServices apiServices;

  AgentsDistributorsActionsDataSourceImpl(this.apiServices);

  @override
  Future<dynamic> addAgent({
    required AddAgentParams addAgentParams,
  }) async {
    try {
      final endPoint = EndPoints.agentDistributor.addAgent;
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.postRequestWithFile(
        endPoint: endPoint,
        data: addAgentParams.agentActionModel.toMap(),
        file: addAgentParams.agentActionModel.imageAgent,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("Error in addAgent: $e");
      throw e.message;
    }
  }

  @override
  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  }) async {
    try {
      final endPoint = EndPoints.agentDistributor.updateAgent(
        updateAgentParams.agentId,
      );
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      await apiServices.postRequestWithFile(
        endPoint: endPoint,
        data: updateAgentParams.agentActionModel.toMap(),
        file: updateAgentParams.agentActionModel.imageAgent,
      );

      return Right(null);
    } catch (e) {
      debugPrint("Error in updateAgent: $e");
      return Left(e.toString());
    }
  }
}
