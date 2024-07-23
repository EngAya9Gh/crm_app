import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/utils/end_points.dart';
import '../model/usermodel.dart';

class UserService {
  Future<UserModel> UpdateUser(
      {required String? idUser,
      required Map<String, dynamic> body,
      File? file,
      String params = ''}) async {
    var data = await Api().postRequestWithFile(
      'array',
      EndPoints.baseUrls.url +
          'users/updateuser_patch.php?id_user=$idUser$params',
      body,
      file,
      null,
    );
    List<UserModel> usersList = [];

    for (int i = 0; i < data.length; i++) {
      usersList.add(UserModel.fromJson(data[i]));
    }
    return usersList[0];
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
