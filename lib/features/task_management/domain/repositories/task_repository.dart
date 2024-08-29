import 'package:dartz/dartz.dart';

import '../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../data/models/user_region_department.dart';
import '../use_cases/get_tasks_usecase.dart';

abstract class TaskRepository {
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String, dynamic> params);

  Future<Either<String, PaginationResponseWrapper>> getTasks(
    GetTaskParams params,
  );

  Future<Result<ResponseWrapper<void>>> changeStatusTask(
      String taskId, Map<String, dynamic> body);

  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>>
      getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body);
}
