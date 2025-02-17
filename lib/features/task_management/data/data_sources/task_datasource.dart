import 'dart:convert';

import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/commentmodel.dart';
import '../../domain/use_cases/add_comment_task_usecase.dart';
import '../../domain/use_cases/get_tasks_usecase.dart';
import '../models/user_region_department.dart';

@injectable
class TaskDatasource {
  const TaskDatasource(this._apiServices);

  final ApiServices _apiServices;

  Future<ResponseWrapper<bool>> addTask(Map<String, dynamic> body) async {
    fun() async {
      FormData formData = FormData();
      if (body['file_path'] != null) {
        final file = body['file_path'];
        formData.files.add(MapEntry('file_path', await MultipartFile.fromFile(file.path)));
      }
      body.forEach((key, value) {
        if (key != 'file_path') formData.fields.add(MapEntry(key, value));
      });

      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.postRequestWithFile(endPoint: EndPoints.task.addTask, data: formData);
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<bool>(message: true, data: true);
    }

    return throwAppException(fun);
  }

  Future<PaginationResponseWrapper> getTasks(
    GetTaskParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.task.filterTasksByAll,
        queryParameters: params.toMap,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getTasks: in datasource => $e");
      throw e.message;
    }
  }

  Future<ResponseWrapper<void>> changeStatusTask(String taskId, Map<String, dynamic> body) async {
    fun() async {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(endPoint: EndPoints.task.changeStatusTask(taskId), data: body);
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<void>(data: [], message: []);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<UserRegionDepartment>>> getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body) async {
    fun() async {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(endPoint: EndPoints.task.getUsersByTypeAdministrationAndRegion, data: body);
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);

      final data = jsonDecode(jsonEncode(response));
      return ResponseWrapper<List<UserRegionDepartment>>(
        data: List.from((data as List<dynamic>).map((e) => UserRegionDepartment.fromJson(e as Map<String, dynamic>))),
        message: List.from((data).map((e) => UserRegionDepartment.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<CommentModel>>> getTaskComments(AddTaskCommentParams params) async {
    fun() async {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: EndPoints.task.getTaskComments(params.taskId));

      final data = jsonDecode(jsonEncode(response));
      return ResponseWrapper<List<CommentModel>>(
        data: List.from((data['message'] as List<dynamic>).map((e) => CommentModel.fromJson(e as Map<String, dynamic>))),
        message: List.from((data['message']).map((e) => CommentModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<bool>> addTaskComment(AddTaskCommentParams params) async {
    fun() async {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(endPoint: EndPoints.task.addTaskComment(params.taskId), data: params.toMap());
      return ResponseWrapper<bool>(message: true, data: true);
    }

    return throwAppException(fun);
  }
}
