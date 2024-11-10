import 'package:flutter/cupertino.dart';

import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';

class ClientActivitiesPageVariablesEntity {
  List<ClientActivityModel> allList;
  int totalCount;
  String clientId;
  bool hasReachedEnd;
  TextEditingController searchController;
  TextEditingController startDataController;
  TextEditingController endDataController;
  ValueNotifier<String?> priority = ValueNotifier(null);
  ValueNotifier<String?> activityState = ValueNotifier(null);
  ValueNotifier<String?> fkUser = ValueNotifier(null);

  ClientActivitiesPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.clientId = "",
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