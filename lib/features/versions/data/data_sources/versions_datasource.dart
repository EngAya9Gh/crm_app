import 'dart:developer';

import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/data/models/incomming_update.dart';
import 'package:crm_smart/features/versions/domain/use_cases/add_demand_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/change_demand_status_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_demands_usecase.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../model/versionModel.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../../domain/use_cases/get_versions_usecase.dart';

abstract class NotificationsDatasource {
  Future<PaginationResponseWrapper> getVersions(
    GetVersionsParams params,
  );

  Future<bool> addVersion(AddVersionPramas addVersionPramas);

  Future<ResponseWrapper<VersionModel>> updateVersion(AddVersionPramas addVersionPramas);
  Future<ResponseWrapper<IconmmingUpdateInfo>> getIncommingUpdateInfo();
  Future<ResponseWrapper<DemandModel>> addDemand(AddOrUpdateDemandParams params);
  Future<ResponseWrapper<List<DemandModel>>> getDemands(GetDemandParams params);
  Future<ResponseWrapper<DemandModel>> changeDemandStatus(DemandChangeStatusOrCommentParams params);
  Future<ResponseWrapper<CommentModel>> addDemandComment(DemandChangeStatusOrCommentParams params);
  Future<ResponseWrapper<List<CommentModel>>> getDemandComments(DemandChangeStatusOrCommentParams params);
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
      print(addVersionPramas.toParamsAdd());
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.versions.addVersions, data: addVersionPramas.toParamsAdd());
      if (response['code'] == 200) {
        return true;
      } else {
        print("########################${response.statusCode}");
        return false;
      }
    } on Exception catch (e) {
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

  @override
  Future<ResponseWrapper<VersionModel>> updateVersion(AddVersionPramas addVersionPramas) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.versions.updateVersions(addVersionPramas.id!), data: addVersionPramas.toParamsUpdate());
      return ResponseWrapper.fromJson(
        response,
        (json) => VersionModel.fromJson(json),
      );
    } on BaseAppException catch (e) {
      debugPrint("error in getNotifications in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<ResponseWrapper<IconmmingUpdateInfo>> getIncommingUpdateInfo() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.versions.getIncommingUpdateInfo);
      return ResponseWrapper.fromJson(
        response,
        (json) => IconmmingUpdateInfo.fromJson(json),
      );
    } on BaseAppException catch (e) {
      debugPrint("error in get Incomming Update Info in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<ResponseWrapper<DemandModel>> addDemand(AddOrUpdateDemandParams params) {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
          endPoint: params.idDemand != null ? EndPoints.versions.updateDemand(params.idDemand!) : EndPoints.versions.addDemand, data: params.toMap());

      return ResponseWrapper<DemandModel>.fromJson(response, (json) => DemandModel.fromJson(json));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<List<DemandModel>>> getDemands(GetDemandParams params) {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.versions.addDemand, queryParameters: params.toMap());

      return ResponseWrapper<List<DemandModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => DemandModel.fromJson(e as Map<String, dynamic>))));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<DemandModel>> changeDemandStatus(DemandChangeStatusOrCommentParams params) {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.versions.changeDemandStatus(params.idDemand), data: params.toMapChangeStatus());

      return ResponseWrapper<DemandModel>.fromJson(response, (json) => DemandModel.fromJson(json));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<CommentModel>> addDemandComment(DemandChangeStatusOrCommentParams params) {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.versions.addDemandComments(params.idDemand), data: params.toMapAddComment());

      return ResponseWrapper<CommentModel>.fromJson(response, (json) => CommentModel.fromJson(json));
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<List<CommentModel>>> getDemandComments(DemandChangeStatusOrCommentParams params) {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.versions.getDemandComments(params.idDemand));

      return ResponseWrapper<List<CommentModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => CommentModel.fromJson(e as Map<String, dynamic>))));
    }

    return throwAppException(fun);
  }
}
