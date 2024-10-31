import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/errors/server_exceptions.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_privileges_usecase.dart';
import '../../domain/use_cases/update_privileges_usecase.dart';

abstract class PrivilegesDatasource {
  Future<PaginationResponseWrapper> getPrivileges(GetPrivilegesParams params);

  Future<PaginationResponseWrapper> updatePrivileges(
    UpdatePrivilegesParams params,
  );
}

@LazySingleton(as: PrivilegesDatasource)
class PrivilegesDatasourceImpl implements PrivilegesDatasource {
  final ApiServices _api;

  PrivilegesDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getPrivileges(
    GetPrivilegesParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.privilege.getPrivileges(params.levelId),
        queryParameters: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getPrivileges in datasource=> $e");
      throw e.message;
    }
  }

  @override
  Future<PaginationResponseWrapper> updatePrivileges(
    UpdatePrivilegesParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.postRequestWithFile(
        endPoint: EndPoints.privilege.updatePrivileges,
        data: params.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on ServerException catch (e) {
      debugPrint("error in updatePrivileges in datasource=> $e");
      throw e.message;
    }
  }
}
