import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/agents_distributors_repo.dart';
import '../../domain/use_cases/change_state_agent_usecase.dart';
import '../../domain/use_cases/get_agents_and_distributors_usecase.dart';
import '../data_sources/remote_data_source/agents_distributors_data_source.dart';
import '../models/agent_distributor_model.dart';

@LazySingleton(as: AgentsDistributorsRepo)
class AgentsDistributorsRepoImpl extends AgentsDistributorsRepo {
  final AgentsDistributorsDataSource dataSource;

  AgentsDistributorsRepoImpl(this.dataSource);

  @override
  Future<Either<String, List<AgentDistributorModel>>> getAgentsAndDistributors(
    GetAgentsAndDistributorsParams params,
  ) async {
    try {
      final data = await dataSource.getAgentsAndDistributors(params);
      final List<AgentDistributorModel> agents =
          List<AgentDistributorModel>.from(
        data.map((e) => AgentDistributorModel.fromJson(e)),
      );

      return Right(agents);
    } catch (e) {
      debugPrint("Error in getAgentsAndDistributors: $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> changeStateAgent({
    required ChangeStateAgentParams changeStateAgentParams,
  }) async {
    try {
      final data = await dataSource.changeStateAgent(
        changeStateAgentParams: changeStateAgentParams,
      );

      return Right(AgentDistributorModel.fromJson(data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
