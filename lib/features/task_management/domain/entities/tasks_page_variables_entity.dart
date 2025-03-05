import 'package:flutter/material.dart';

import '../../../../core/common/models/location/branch_model.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/task_model.dart';

class TasksPageVariablesEntity {
  List<TaskModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;
  final ValueNotifier<BranchModel?> selectedBranchModel = ValueNotifier(null);
  final ValueNotifier<ManageModel?> selectedManagerModel = ValueNotifier(null);
  final ValueNotifier<UserModel?> selectedUserModel = ValueNotifier(null);
  final ValueNotifier<bool?> atTime = ValueNotifier(null);
  final ValueNotifier<bool?> afterTime = ValueNotifier(null);

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  Iterable<Listenable?> listenables() {
    return [
      selectedBranchModel,
      selectedUserModel,
      selectedManagerModel,
      atTime,
      afterTime,
    ];
  }

  void clearFilters() {
    selectedBranchModel.value = null;
    selectedUserModel.value = null;
    selectedManagerModel.value = null;
    atTime.value = null;
    afterTime.value = null;
  }

  bool checkIfFilterIsNotEmpty() {
    return selectedManagerModel.value != null ||
        selectedUserModel.value != null ||
        selectedBranchModel.value != null ||
        atTime.value != null ||
        afterTime.value != null;
  }
}
