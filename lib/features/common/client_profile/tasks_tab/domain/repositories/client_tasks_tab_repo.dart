import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../task_management/data/models/task_model.dart';
import '../use_cases/get_client_tasks_usecase.dart';

abstract interface class ClientTasksTabRepo {
  Future<Result<ResponseWrapper<List<TaskModel>>>> getClientTasks(GetClientTasksParams params);
}
