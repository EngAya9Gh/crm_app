import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';

import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/usermodel.dart';
import '../../../../task_management/data/models/user_region_department.dart';
import '../../domain/use_cases/get_branches_for_user_usecase.dart';
import '../../domain/use_cases/get_levels_for_user_usecase.dart';
import '../../domain/use_cases/get_manages_for_user_usecase.dart';
import '../../domain/use_cases/get_users_usecase.dart';

abstract class UsersDatasource {
  Future<ResponseWrapper<List<UserModel>>> getAllUsers(GetUsersParams params);

  Future<ResponseWrapper<UserModel>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });

  Future<ResponseWrapper<UserModel>> editUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  });

  Future<dynamic> getManagesForUser(GetManagesForUserParams params);

  Future<dynamic> getLevelsForUser(GetLevelsForUserParams params);

  Future<dynamic> getBranchesForUser(GetBranchesForUserParams params);

  Future<PaginationResponseWrapper> getUserById(GetUserByIdParams params);

  Future<ResponseWrapper<List<UserModel>>> getUserSelected();
  Future<ResponseWrapper<List<UserModel>>> getUsersAll();
}

@LazySingleton(as: UsersDatasource)
class UsersDatasourceImpl implements UsersDatasource {
  final ApiServices _api;

  UsersDatasourceImpl(this._api);

  Future<ResponseWrapper<List<UserModel>>> getAllUsers(GetUsersParams params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.users.getUsers,
        queryParameters: params.toParams(),
      );

      return ResponseWrapper<List<UserModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return UserModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<PaginationResponseWrapper> getUserById(
    GetUserByIdParams params,
  ) async {
    _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _api.get(
      endPoint: EndPoints.users.getUsers,
      // queryParameters: params.toParams(),
    );

    return PaginationResponseWrapper.fromJson(response);
  }

  Future<ResponseWrapper<UserModel>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) async {
    fun() async {
      try {
        _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
        final response = await _api.post(endPoint: EndPoints.users.addUser, data: body);

        return ResponseWrapper<UserModel>.fromJson(
          response,
          (json) => UserModel.fromJson(json),
        );
      } on BaseAppException catch (e) {
        debugPrint('error in addUser ${e.message}');
        rethrow;
      } catch (e, s) {
        debugPrintStack(stackTrace: s);
        debugPrint('error in addUser $e');
        rethrow;
      }
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<UserModel>> editUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.users.updateUser(param["id_user"]),
        data: body,
      );
      return ResponseWrapper<UserModel>.fromJson(
        response,
        (json) => UserModel.fromJson(json),
      );
    }

    return throwAppException(fun);
  }

  @override
  Future getBranchesForUser(GetBranchesForUserParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.city.getBranches,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getBranchesForUser ${e.message}');
      throw e.message;
    }
  }

  @override
  Future getLevelsForUser(GetLevelsForUserParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.users.getLevelsForUser,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getLevelsForUser ${e.message}');
      throw e.message;
    }
  }

  @override
  Future getManagesForUser(GetManagesForUserParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.users.getManagesForUser,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getManagesForUser ${e.message}');
      throw e.message;
    }
  }

  Future<ResponseWrapper<List<UserModel>>> getUserSelected() async {
    fun() async {
      var _apiServices = getIt<ApiServices>();
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: EndPoints.task.getUserSelect);

      return ResponseWrapper<List<UserModel>>(
        data: List.from((response['message'] as List<dynamic>).map((e) => UserModel.fromJson(e as Map<String, dynamic>))),
        message: List.from((response['message']).map((e) => UserModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  @override
  Future<ResponseWrapper<List<UserModel>>> getUsersAll() {
    fun() async {
      var _apiServices = getIt<ApiServices>();
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: EndPoints.users.getUsersAll);

      return ResponseWrapper<List<UserModel>>(
        data: List.from((response['message'] as List<dynamic>).map((e) => UserModel.fromJson(e as Map<String, dynamic>))),
        message: List.from((response['message']).map((e) => UserModel.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }
}
