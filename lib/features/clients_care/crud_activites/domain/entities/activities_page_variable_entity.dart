import 'package:flutter/cupertino.dart';

import '../../../client_communications/data/models/client_activity_model.dart';

class ActivitiesPageVariablesEntity {
  List<ClientActivityModel> allList;
  int totalCount;
  bool hasReachedEnd;
  TextEditingController searchController;
  TextEditingController startDataController;
  TextEditingController endDataController;
  ValueNotifier<String?> priority = ValueNotifier(null);
  ValueNotifier<String?> activityState = ValueNotifier(null);
  ValueNotifier<String?> fkUser = ValueNotifier(null);
  bool isNewFilter;
  ActivitiesPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.hasReachedEnd = false,
    this.isNewFilter = true,
    TextEditingController? searchController,
    TextEditingController? startDataController,
    TextEditingController? endDataController,
  }) : searchController = searchController ?? TextEditingController(),
        startDataController = startDataController ?? TextEditingController(),
        endDataController = endDataController ?? TextEditingController();

  void clear() {
    searchController.clear();
    startDataController.clear();
    endDataController.clear();
    fkUser = ValueNotifier(null);
    priority = ValueNotifier(null);
    activityState = ValueNotifier(null);
  }
}