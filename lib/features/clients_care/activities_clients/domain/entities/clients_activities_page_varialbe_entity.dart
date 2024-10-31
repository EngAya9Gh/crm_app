import 'package:flutter/cupertino.dart';

import '../../data/models/client_activity_model.dart';

class ClientsActivitiesPageVariablesEntity {
  List<ClientActivityModel> allList;
  int totalCount;
  bool hasReachedEnd;
  TextEditingController searchController;

  ClientsActivitiesPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.hasReachedEnd = false,
    TextEditingController? searchController,
  }) : searchController = searchController ?? TextEditingController();
}