import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/task_management/data/data_sources/task_datasource.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl(this.datasource);

  final TaskDatasource datasource;

  @override
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String, dynamic> params) {
    return toApiResult(() => datasource.addTask(params));
  }

  @override
  Future<Result<ResponseWrapper<List<TaskModel>>>> filterTasks(Map<String, dynamic> params) {
    return toApiResult(() => datasource.filterTask(params));
  }
}
