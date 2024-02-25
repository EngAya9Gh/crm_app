import 'dart:convert';

import 'package:crm_smart/core/api/api_services.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../models/user_region_department.dart';

@injectable
class TaskDatasource {
  const TaskDatasource(this.api);

  final ApiServices api;

  Future<ResponseWrapper<bool>> addTask(Map<String, dynamic> body) async {
    fun() async {
      FormData formData = FormData();
      if (body['file_path'] != null) {
        final file = body['file_path'];
        formData.files.add(
            MapEntry('file_path', await MultipartFile.fromFile(file.path)));
      }
      body.forEach((key, value) {
        if (key != 'file_path') formData.fields.add(MapEntry(key, value));
      });

      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response =
          await api.post(endPoint: EndPoints.task.addTask, data: formData);
      api.changeBaseUrl(EndPoints.baseUrl);

      return ResponseWrapper<bool>(message: true, data: true);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<TaskModel>>> filterTask(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response =
          await api.post(endPoint: EndPoints.task.filterTasksByAll, data: body);
      api.changeBaseUrl(EndPoints.baseUrl);
      if (response['data'] != false)
        return ResponseWrapper<List<TaskModel>>(
          data: List.from((response['data'] as List<dynamic>)
              .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))),
          message: [],
        );
      return ResponseWrapper<List<TaskModel>>(
        data: [],
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<void>> changeStatusTask(
      String taskId, Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
          endPoint: EndPoints.task.changeStatusTask + taskId, data: body);
      api.changeBaseUrl(EndPoints.baseUrl);
      return ResponseWrapper<void>(data: [], message: []);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<UserRegionDepartment>>>
      getUsersByTypeAdministrationAndRegion(Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
          endPoint: EndPoints.task.getUsersByTypeAdministrationAndRegion,
          data: body);
      api.changeBaseUrl(EndPoints.baseUrl);

      final data = jsonDecode(jsonEncode(response));
      return ResponseWrapper<List<UserRegionDepartment>>(
        data: List.from((data as List<dynamic>).map(
            (e) => UserRegionDepartment.fromJson(e as Map<String, dynamic>))),
        message: List.from((data).map(
            (e) => UserRegionDepartment.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }
}
