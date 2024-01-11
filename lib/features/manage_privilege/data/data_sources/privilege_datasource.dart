import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/manage_privilege/data/models/level_model.dart';
import 'package:crm_smart/features/manage_privilege/data/models/privilege_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/constants/route.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client_config.dart';

@injectable
class PrivilegeDatasource {
  PrivilegeDatasource(this._clientApi);

  final ClientApi _clientApi;

  Future<ResponseWrapper<List<PrivilegeModel>>> getPrivileges(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.privilege.getPrivileges,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<PrivilegeModel>>.fromJson(
        response.data,
        (json) => List.from((json as List<dynamic>).map((e) => PrivilegeModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<LevelModel>>> getLevels() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.privilege.getLevels,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<LevelModel>>.fromJson(
        response.data,
        (json) => List.from((json as List<dynamic>).map((e) => LevelModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> addLevel(Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.privilege.addLevel,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<String>.fromJson(response.data, (json) => json);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<void>> updatePrivileges(Map<String, dynamic> body) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.privilege.updatePrivileges,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      return ResponseWrapper(message: null, data: null);
    }

    return throwAppException(fun);
  }
}
