import 'dart:io';

import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.users.updateUserProfile(idUser!),
      // queryParameters: {'id_user': idUser},
      data: body,
    );

    final data = response['message'];

    return UserModel.fromJson(data);
  }

  Future<UserModel> UpdateProfileImage({
    XFile? file,
    Map<String, dynamic>? params,
    String? iduser,
  }) async {
    FormData formData = FormData();
    params?.forEach((key, value) {
      formData.fields.add(MapEntry(key, value));
    });
    final ApiServices _apiServices = getIt<ApiServices>();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await _apiServices.postRequestWithFile(
      endPoint: EndPoints.users.updateUserProfile(iduser!),
      file: file,
      data: formData,
    );

    final data = response['message'];

    return UserModel.fromJson(data);
  }

  Future<List<UserModel>> usersServices() async {
    try {
      var api = await getIt<ApiServices>()
        ..changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await api.get(endPoint: EndPoints.users.getAllUsers);
      List<dynamic> data = response['message'];
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
