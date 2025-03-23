import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_task_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/change_task_assign_usecase.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/commentmodel.dart';
import '../../data/models/user_region_department.dart';
import '../../data/models/users_report_model.dart';
import '../use_cases/add_comment_task_usecase.dart';
import '../use_cases/add_users_report_usecase.dart';
import '../use_cases/get_tasks_usecase.dart';

abstract class TaskRepository {
  Future<Result<ResponseWrapper<bool>>> addTask(Map<String, dynamic> params);

  Future<Either<String, PaginationResponseWrapper>> getTasks(
    GetTaskParams params,
  );

  Future<Result<ResponseWrapper<void>>> changeStatusTask(String taskId, Map<String, dynamic> body);

  Future<Result<ResponseWrapper<List<UserRegionDepartment>>>> getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body);

  Future<Result<ResponseWrapper<List<CommentModel>>>> getTaskComments(AddTaskCommentParams params);

  Future<Result<ResponseWrapper<bool>>> addTaskComments(AddTaskCommentParams params);
  Future<Result<ResponseWrapper<List<UserReportModel>>>> getUsersReports(GetUsersReportsParams params);
  Future<Result<ResponseWrapper<List<ClientModel>>>> getListClients();
  Future<Result<ResponseWrapper<TaskModel>>> updateTask(AddOrUpdateTaskParams params);
  Future<Result<ResponseWrapper<TaskModel>>> changeTaskAssign(ChangeTaskAssignParams params);
}
