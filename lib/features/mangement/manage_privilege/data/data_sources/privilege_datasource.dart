import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_privilege_usecase.dart';
import '../models/level_model.dart';

@injectable
class PrivilegesDatasource {
  PrivilegesDatasource(this._api);

  final ApiServices _api;

  Future<PaginationResponseWrapper> getPrivileges(
    GetPrivilegesParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.privilege.getPrivileges(params.levelId),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getPrivileges in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<ResponseWrapper<List<LevelModel>>> getLevels() async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(endPoint: EndPoints.privilege.getLevels);

      return ResponseWrapper<List<LevelModel>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>)
            .map((e) => LevelModel.fromMap(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> addLevel(Map<String, dynamic> body) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response =
          await _api.post(endPoint: EndPoints.privilege.addLevel, data: body);

      return ResponseWrapper<String>.fromJson(response, (json) => json);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<void>> updatePrivileges(
      Map<String, dynamic> body) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
          endPoint: EndPoints.privilege.updatePrivileges, data: body);
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper(message: null, data: null);
    }

    return throwAppException(fun);
  }
}
