import 'package:crm_smart/core/common/enums/users/user_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_users_usecase.dart';

abstract class UsersDatasource {
  Future<dynamic> getUsers(GetUsersParams params);
}

@LazySingleton(as: UsersDatasource)
class UsersDatasourceImpl implements UsersDatasource {
  final ApiServices _apiServices;

  UsersDatasourceImpl(this._apiServices);

  @override
  Future<dynamic> getUsers(GetUsersParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.users.getUsersByType(params.user.toPath),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint('error in getUsers in datasource => $e');
      throw e.message;
    }
  }
}
