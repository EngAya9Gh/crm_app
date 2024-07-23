import 'package:flutter/material.dart';

import '../../../../../model/usermodel.dart';

class UsersPageVariablesEntity {
  List<UserModel> usersList = [];
  int totalUsersCount = 0;

  TextEditingController searchController = TextEditingController();

  bool isNewFilter = true;

  bool hasReachedEnd = false;
}
