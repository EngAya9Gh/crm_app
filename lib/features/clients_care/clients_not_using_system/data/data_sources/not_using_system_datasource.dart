import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_not_using_system_usecase.dart';

abstract class NotUsingSystemDatasource {
  Future<PaginationResponseWrapper> getNotUsingSystem(
    GetNotUsingSystemParams params,
  );
}

@LazySingleton(as: NotUsingSystemDatasource)
class NotUsingSystemDatasourceImpl implements NotUsingSystemDatasource {
  final ApiServices _api;

  const NotUsingSystemDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getNotUsingSystem(
    GetNotUsingSystemParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await _api.get(
        endPoint: EndPoints.care.getNotUsingSystem,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getNotUsingSystem in datasource => $e");
      throw e.message;
    }
  }
}
