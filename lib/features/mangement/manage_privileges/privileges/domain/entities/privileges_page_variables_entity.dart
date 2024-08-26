import 'package:flutter/material.dart';

import '../../../levels/data/models/level_model.dart';
import '../../data/models/privilege_model.dart';

class PrivilegesPageVariablesEntity {
  late LevelModel currentLevel;

  List<PrivilegeModel> userPrivileges = [];
  List<PrivilegeModel> allList = [];
  List<PrivilegeModel> tempList = [];

  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
