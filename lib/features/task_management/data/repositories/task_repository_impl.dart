import 'package:crm_smart/model/usermodel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/services/api/result.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/use_cases/get_tasks_usecase.dart';
import '../data_sources/task_datasource.dart';
import '../models/task_model.dart';
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
  Future<Either<String, PaginationResponseWrapper>> getTasks(
    GetTaskParams params,
  ) async {
    try {
      final response = await datasource.getTasks(params);
      return Right(response.copyWith(
        data: List<TaskModel>.from(response.data.map((e) => TaskModel.fromJson(e))),
      ));
    } catch (e) {
      debugPrint("error in getTasks: in repository => $e");
      return Left(e.toString());
    }
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
