import 'package:flutter/material.dart';

import '../../../../core/common/models/location/branch_model.dart';
import '../../data/models/task_model.dart';

class TasksPageVariablesEntity {
  List<TaskModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;
  final ValueNotifier<BranchModel?> selectedBranchModel = ValueNotifier(null);

  bool isNewFilter = true;
  bool hasReachedEnd = false;
  Iterable<Listenable?> listenables() {
    return [
      selectedBranchModel,
    ];
  }

}
