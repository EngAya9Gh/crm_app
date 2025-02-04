import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_client_tasks_usecase.dart';

abstract interface class ClientTasksTabDataSource {
  Future<ResponseWrapper<List<TaskModel>>> getClientTasks(GetClientTasksParams params);
}

@LazySingleton(as: ClientTasksTabDataSource)
class ClientTasksTabDataSourceImpl implements ClientTasksTabDataSource {
  final ApiServices _apiServices;

  ClientTasksTabDataSourceImpl(this._apiServices);

  @override
  Future<ResponseWrapper<List<TaskModel>>> getClientTasks(GetClientTasksParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.client.getClientTasks(params.idClient),
      );

      return ResponseWrapper<List<TaskModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => TaskModel.fromJson(e as Map<String, dynamic>))));
    } on BaseAppException catch (e) {
      debugPrint("error in getClientLogs => ${e.message}");
      throw e.message;
    }
  }
}
