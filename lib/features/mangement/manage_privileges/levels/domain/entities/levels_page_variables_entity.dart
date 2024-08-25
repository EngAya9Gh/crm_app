import 'package:flutter/cupertino.dart';

import '../../../manage_privilege/data/models/level_model.dart';

class LevelsPageVariablesEntity {
  List<LevelModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
