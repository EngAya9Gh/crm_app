import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../../domain/repositories/waiting_agents_repo.dart';
import '../../domain/use_cases/waiting_agents_usecase.dart';
import '../data_sources/waiting_agents_datasource.dart';

@LazySingleton(as: WaitingAgentsRepo)
class WaitingAgentsRepoImpl implements WaitingAgentsRepo {
  final WaitingAgentsDataSource _dataSource;

  WaitingAgentsRepoImpl(this._dataSource);

  @override
  Future<Either<String, List<AgentDistributorModel>>> getWaitingAgents(
    GetWaitingAgentsParams params,
  ) async {
    try {
      final data = await _dataSource.getWaitingAgents(params);
      final agents = List<AgentDistributorModel>.from(data.map((e) {
        return AgentDistributorModel.fromJson(e);
      }));

      return Right(agents);
    } catch (e) {
      debugPrint("error in getWaitingAgents: $e");
      return Left(e.toString());
    }
  }
}
