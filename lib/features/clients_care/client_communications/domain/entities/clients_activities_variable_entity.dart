import 'package:flutter/cupertino.dart';

import '../../../client_activites/data/models/activity_type_model.dart';
import '../../data/models/client_activity_model.dart';

class ClientsActivitiesPageVariablesEntity {
  List<ClientActivityModel> allList;
  int totalCount;
  bool hasReachedEnd;
  TextEditingController searchController;
  TextEditingController startDataController;
  TextEditingController endDataController;
  ValueNotifier<String?> priority = ValueNotifier(null);
  ValueNotifier<String?> activityState = ValueNotifier(null);
  ValueNotifier<String?> fkUser = ValueNotifier(null);

  ClientsActivitiesPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.hasReachedEnd = false,
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