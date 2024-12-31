import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../core/services/api/result.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../../domain/use_cases/get_versions_usecase.dart';

abstract class NotificationsDatasource {
  Future<PaginationResponseWrapper> getVersions(
    GetVersionsParams params,
  );

  Future<bool> addVersion(AddVersionPramas addVersionPramas);
}

@LazySingleton(as: NotificationsDatasource)
class NotificationsDatasourceImpl implements NotificationsDatasource {
  final ApiServices _api;

  const NotificationsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getVersions(
    GetVersionsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.versions.getAllVersions,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getNotifications in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<bool> addVersion(AddVersionPramas addVersionPramas) async {
    try {
      print(addVersionPramas.toParams());
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.versions.addVersions, data: addVersionPramas.toParams());
      if (response.statusCode == 200) {
        return true;
      } else {
        print("########################${response.statusCode}");
        return false;
      }
    }
    on Exception catch (e) {
      throw Exception(e);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw Exception(e);
    }
    // on BaseAppException catch (e) {
    //   debugPrint("error in getNotifications in datasource => $e");
    //   throw e.message;
    // }
  }
}
