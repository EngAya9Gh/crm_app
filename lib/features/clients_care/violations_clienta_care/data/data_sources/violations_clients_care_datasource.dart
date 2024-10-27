import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_violations_usecase.dart';

abstract class VioltionsClientsCareDatasource {
  Future<PaginationResponseWrapper> getVioltions(
      GetViolationsParams params,
      );
}

@LazySingleton(as: VioltionsClientsCareDatasource)
class VioltionsClientsCareDatasourceImpl implements VioltionsClientsCareDatasource {
  final ApiServices _api;

  const VioltionsClientsCareDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getVioltions(
      GetViolationsParams params,
      ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await _api.get(
        endPoint: EndPoints.client.violations,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getWrongNumbers in datasource => $e");
      throw e.message;
    }
  }
}
