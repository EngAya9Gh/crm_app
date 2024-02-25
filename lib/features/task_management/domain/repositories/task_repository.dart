import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';

import '../../data/models/user_region_department.dart';

abstract class TaskRepository {
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<TaskModel>>>> filterTasks(
      Map<String, dynamic> params);
  Future<Result<ResponseWrapper<void>>> changeStatusTask(
      String taskId, Map<String, dynamic> body);
  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>>
      getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body);
}
