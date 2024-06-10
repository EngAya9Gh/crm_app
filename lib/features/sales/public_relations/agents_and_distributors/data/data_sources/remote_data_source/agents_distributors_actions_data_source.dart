import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/services/api/api_services.dart';
import '../../../../../../../core/utils/end_points.dart';
import '../../../../../../../model/maincitymodel.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';
import '../../../domain/use_cases/update_agent_usecase.dart';

abstract class AgentsDistributorsActionsDataSource {
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  });

  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  });

  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  });

  Future<dynamic> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  });
}

@LazySingleton(as: AgentsDistributorsActionsDataSource)
class AgentsDistributorsActionsDataSourceImpl
    extends AgentsDistributorsActionsDataSource {
  final ApiServices apiServices;

  AgentsDistributorsActionsDataSourceImpl(this.apiServices);

  @override
  Future<Either<String, List<CityModel>>> getAllCities({
    required String fkCountry,
  }) async {
    try {
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await apiServices.get(
        endPoint: "${EndPoints.city.getAllCities}$fkCountry",
      );

      final data = response["message"];

      final List<CityModel> citiesList = [];
      for (var city in data) {
        citiesList.add(CityModel.fromJson(city));
      }
      return Right(citiesList);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addAgent({
    required AddAgentParams addAgentParams,
  }) async {
    try {
      final endPoint = EndPoints.agentDistributor.addAgent;
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      await apiServices.postRequestWithFile(
        url: endPoint,
        data: addAgentParams.agentActionModel.toMap(),
        file: addAgentParams.file,
        fileLogo: addAgentParams.agentActionModel.filelogo,
        files: addAgentParams.files,
      );
      return Right(null);
    } catch (e) {
      debugPrint("Error in addAgent: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  }) async {
    try {
      final endPoint =
          "${EndPoints.agentDistributor.updateAgent}${updateAgentParams.agentId}";
      await apiServices.postRequestWithFile(
        url: endPoint,
        data: updateAgentParams.agentActionModel.toMap(),
        file: updateAgentParams.file,
        fileLogo: updateAgentParams.agentActionModel.filelogo,
      );

      return Right(null);
    } catch (e) {
      debugPrint("Error in updateAgent: $e");
      return Left(e.toString());
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
      final response = await apiServices.post(
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
