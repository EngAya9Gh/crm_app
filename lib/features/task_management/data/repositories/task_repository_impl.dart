import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/services/api/result.dart';
import '../data_sources/task_datasource.dart';
import '../models/task_model.dart';
import '../../domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/user_region_department.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl(this.datasource);

  final TaskDatasource datasource;

  @override
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String, dynamic> params) {
    return toApiResult(() => datasource.addTask(params));
  }

  @override
  Future<Result<ResponseWrapper<List<TaskModel>>>> filterTasks(
      Map<String, dynamic> params) {
    return toApiResult(() => datasource.filterTask(params));
  }

  @override
  Future<Result<ResponseWrapper<void>>> changeStatusTask(
      String taskId, Map<String, dynamic> body) {
    return toApiResult(() => datasource.changeStatusTask(taskId, body));
  }

  @override
  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>>
      getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body) {
    return toApiResult(
        () => datasource.getUsersByTypeAdministrationAndRegion(body));
  }
}
