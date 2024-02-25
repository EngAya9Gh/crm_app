import 'package:crm_smart/core/api/api_services.dart';
import 'package:crm_smart/features/manage_privilege/data/models/level_model.dart';
import 'package:crm_smart/features/manage_privilege/data/models/privilege_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';

@injectable
class PrivilegeDatasource {
  PrivilegeDatasource(this.api);

  final ApiServices api;

  Future<ResponseWrapper<List<PrivilegeModel>>> getPrivileges(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(
          endPoint: EndPoints.privilege.getPrivileges, queryParameters: body);
      return ResponseWrapper<List<PrivilegeModel>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>)
            .map((e) => PrivilegeModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<LevelModel>>> getLevels() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response = await api.get(endPoint: EndPoints.privilege.getLevels);

      return ResponseWrapper<List<LevelModel>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>)
            .map((e) => LevelModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> addLevel(Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrl);
      final response =
          await api.post(endPoint: EndPoints.privilege.addLevel, data: body);

      return ResponseWrapper<String>.fromJson(response, (json) => json);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<void>> updatePrivileges(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.apiBaseUrl2);
      final response = await api.post(
          endPoint: EndPoints.privilege.updatePrivileges, data: body);
      api.changeBaseUrl(EndPoints.baseUrl);
      return ResponseWrapper(message: null, data: null);
    }

    return throwAppException(fun);
  }
}
