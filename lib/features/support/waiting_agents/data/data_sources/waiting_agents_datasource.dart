import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/api/api_services.dart';
import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../../domain/use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsDataSource {
  Future<ResponseWrapper<List<AgentDistributorModel>>> getWaitingAgents(GetWaitingAgentsParams params);
}

@LazySingleton(as: WaitingAgentsDataSource)
class WaitingAgentsDataSourceImpl implements WaitingAgentsDataSource {
  final ApiServices _apiServices;

  WaitingAgentsDataSourceImpl(this._apiServices);

  @override
  Future<ResponseWrapper<List<AgentDistributorModel>>> getWaitingAgents(GetWaitingAgentsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.agentDistributor.waitingTrainingAgents,
        queryParameters: params.toMap(),
      );

      // final data = apiDataHandler(response);

      return ResponseWrapper<List<AgentDistributorModel>>.fromJson(response, (json) {
        return List.from((json as List<dynamic>).map((e) {
          return AgentDistributorModel.fromJson(e as Map<String, dynamic>);
        }));
      },);
    } on BaseAppException catch (e) {
      debugPrint("error in getWaitingAgents: ${e.message}");
      throw e.message;
    }
  }
}
