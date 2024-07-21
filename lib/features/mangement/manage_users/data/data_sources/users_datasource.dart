import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/usermodel.dart';
import '../../domain/use_cases/get_users_usecase.dart';

@injectable
class UsersDatasource {
  final ApiServices api;

  UsersDatasource(this.api);

  Future<ResponseWrapper<List<UserModel>>> getAllUsers(
      GetUsersParams params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
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

  Future<ResponseWrapper<UserModel>> addUser({
    required Map<String, dynamic> body,
    required Map<String, dynamic> param,
  }) async {
    fun() async {
      try {
        api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
        final response =
            await api.post(endPoint: EndPoints.users.addUser, data: body);

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
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
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
}
