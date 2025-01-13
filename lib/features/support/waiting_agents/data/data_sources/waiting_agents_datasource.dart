import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/api/api_services.dart';
import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/waiting_agents_usecase.dart';

abstract interface class WaitingAgentsDataSource {
  Future<dynamic> getWaitingAgents(GetWaitingAgentsParams params);
}

@LazySingleton(as: WaitingAgentsDataSource)
class WaitingAgentsDataSourceImpl implements WaitingAgentsDataSource {
  final ApiServices _apiServices;

  WaitingAgentsDataSourceImpl(this._apiServices);

  @override
  Future<dynamic> getWaitingAgents(GetWaitingAgentsParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.agentDistributor.waitingTrainingAgents,
        queryParameters: params.toMap(),
      );

      final data = apiDataHandler(response);

      return data;
    } on BaseAppException catch (e) {
      debugPrint("error in getWaitingAgents: ${e.message}");
      throw e.message;
    }
  }
}
