import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violation_type_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_all_management_usecase.dart';
import '../../domain/use_cases/get_violation_types_usecase.dart';
import '../../domain/use_cases/get_violations_usecase.dart';
import '../../domain/use_cases/update_violadtion_usecase.dart';
import '../models/management_model.dart';
import '../models/violations_model.dart';

abstract class ViolationsClientsCareDatasource {
  Future<PaginationResponseWrapper> getViolations(
      GetViolationsParams params,
      );
  Future<ResponseWrapper<ViolationModel>>  updateViolation(
      UpdateViolationParams params,
      );
  Future<ResponseWrapper<List<ManagementModel>>>  getAllManagements(
      GetManagementsParams body,
      );
  Future<ResponseWrapper<List<ViolationType>>> getViolationTypes(
      GetViolationsTypesParams body);
}

@LazySingleton(as: ViolationsClientsCareDatasource)
class ViolationsClientsCareDatasourceImpl implements ViolationsClientsCareDatasource {
  final ApiServices _api;

  const ViolationsClientsCareDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getViolations(
      GetViolationsParams params,
      ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await _api.get(
        endPoint: EndPoints.care.violations,
        queryParameters: params.toParams(),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getWrongNumbers in datasource => $e");
      throw e.message;
    }
  }

  @override
  Future<ResponseWrapper<ViolationModel>> updateViolation(
      UpdateViolationParams params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
          endPoint: EndPoints.care.updateViolation(params.param()), queryParameters: params.toMap());


      _api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<ViolationModel>.fromJson(
        response,
            (json) {
          return ViolationModel.fromJson(json as Map<String, dynamic>);
        },
      );

    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<List<ManagementModel>>> getAllManagements(
      GetManagementsParams body) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
          endPoint: EndPoints.care.getManagement, queryParameters: body.toParams());


      _api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<ManagementModel>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ManagementModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }


  @override
  Future<ResponseWrapper<List<ViolationType>>> getViolationTypes(
      GetViolationsTypesParams body) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
          endPoint: EndPoints.care.getViolationTypes, queryParameters: body.toParams());


      _api.changeBaseUrl(EndPoints.baseUrls.url);

      return ResponseWrapper<List<ViolationType>>.fromJson(
        response,
            (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ViolationType.fromJson(e as Map<String, dynamic>);
          }));
        },
      );

    }

    return throwAppException(fun);
  }



}
