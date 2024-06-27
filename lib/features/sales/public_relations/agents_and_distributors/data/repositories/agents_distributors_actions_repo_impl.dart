import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';

import '../../../../../../model/maincitymodel.dart';
import '../../domain/repositories/agents_distributors_actions_repo.dart';
import '../../domain/use_cases/add_agent_usecase.dart';
import '../../domain/use_cases/update_agent_usecase.dart';
import '../data_sources/remote_data_source/agents_distributors_actions_data_source.dart';
import '../models/agent_distributor_model.dart';

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
  Future<Either<String, AgentDistributorModel>> addAgent({
    required AddAgentParams addAgentParams,
  }) async {
    try {
      final data = await agentsDistributorsActionsDataSource.addAgent(
        addAgentParams: addAgentParams,
      );
      final agent = AgentDistributorModel.fromJson(data);
      return Right(agent);
    } catch (e) {
      debugPrint("error in addAgent: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateAgent({
    required UpdateAgentParams updateAgentParams,
  }) {
    return agentsDistributorsActionsDataSource.updateAgent(
      updateAgentParams: updateAgentParams,
    );
  }
}
