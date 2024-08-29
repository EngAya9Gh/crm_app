import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';

class TasksPageVariablesEntity {
  List<TaskModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
