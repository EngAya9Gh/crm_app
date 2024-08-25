import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/errors/server_exceptions.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/add_level_usecase.dart';
import '../../domain/use_cases/get_levels_usecase.dart';

abstract class LevelsDatasource {
  Future<PaginationResponseWrapper> getLevels(GetLevelsParams params);

  Future<PaginationResponseWrapper> addLevel(AddLevelParams params);
}

@LazySingleton(as: LevelsDatasource)
class LevelsDataSourceImpl implements LevelsDatasource {
  final ApiServices _api;

  LevelsDataSourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getLevels(GetLevelsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(
        endPoint: EndPoints.privilege.getLevels,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getLevels in datasource=> $e");
      throw e.message;
    }
  }

  @override
  Future<PaginationResponseWrapper> addLevel(AddLevelParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.privilege.addLevel,
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on ServerException catch (e) {
      debugPrint("error in addLevel in datasource => $e");
      throw e.message;
    }
  }
}
