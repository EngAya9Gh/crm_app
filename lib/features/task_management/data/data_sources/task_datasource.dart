import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';

@injectable
class TaskDatasource {
  const TaskDatasource(this._clientApi);

  final ClientApi _clientApi;

  Future<ResponseWrapper<bool>> addTask(Map<String, dynamic> body) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final file = body['file_path'];
      FormData formData = FormData();
      formData.files.add(MapEntry('file_path', await MultipartFile.fromFile(file.path)));

      body.forEach((key, value) {
        if (key != 'file_path') formData.fields.add(MapEntry(key, value));
      });

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.task.addTask,
          data: formData,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      return ResponseWrapper<bool>(message: true, data: true);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<TaskModel>>> filterTask(Map<String, dynamic> body) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.task.filterTasksByAll,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';

      return ResponseWrapper<List<TaskModel>>(
        data: List.from((response.data['data'] as List<dynamic>).map((e) => TaskModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }
}
