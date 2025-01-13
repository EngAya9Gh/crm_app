import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/usermodel.dart';

class UserService {
  Future<UserModel> UpdateUser({
    required String? idUser,
    required Map<String, dynamic> body,
    String params = '',
  }) async {
    final ApiServices _apiServices = getIt<ApiServices>();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.users.updateUserProfile,
      queryParameters: {'id_user': idUser},
      data: body,
    );

    final List data = apiDataHandler(response);

    return UserModel.fromJson(data.first);
  }

  Future<UserModel> UpdateProfileImage({
    XFile? file,
    Map<String, dynamic>? params,
  }) async {
    final ApiServices _apiServices = getIt<ApiServices>();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.users.updateProfileImage,
      file: file,
      queryParameters: params,
      data: {},
    );

    final List data = apiDataHandler(response);

    return UserModel.fromJson(data.first);
  }

  Future<List<UserModel>> usersServices() async {
    try {
      List<dynamic> data = await Api()
          .get(url: EndPoints.baseUrls.url + EndPoints.users.allUsers);
      List<UserModel> usersList = [];

      for (int i = 0; i < data.length; i++) {
        usersList.add(UserModel.fromJson(data[i]));
      }

      return usersList;
    } catch (e) {
      debugPrint('Error in usersServices => $e');
      throw e;
    }
  }

}
