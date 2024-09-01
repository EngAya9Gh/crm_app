import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_wrong_numbers_usecase.dart';

abstract class WrongNumbersDatasource {
  Future<PaginationResponseWrapper> getWrongNumbers(
    GetWrongNumbersParams params,
  );
}

@LazySingleton(as: WrongNumbersDatasource)
class WrongNumbersDatasourceImpl implements WrongNumbersDatasource {
  final ApiServices _api;

  const WrongNumbersDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getWrongNumbers(
    GetWrongNumbersParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await _api.get(
        endPoint: EndPoints.care.getWrongNumbers,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getWrongNumbers in datasource => $e");
      throw e.message;
    }
  }
}
