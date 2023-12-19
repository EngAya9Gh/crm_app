import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';

abstract class TaskRepository {
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String,dynamic> params);
  Future<Result<ResponseWrapper<List<TaskModel>>>> filterTasks(Map<String,dynamic> params);
}
