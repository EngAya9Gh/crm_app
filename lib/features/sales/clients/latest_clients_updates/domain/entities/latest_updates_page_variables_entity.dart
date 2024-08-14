import 'package:flutter/material.dart';

import '../../../../../../model/lastCommentClientModel.dart';

class LatestUpdatesPageVariablesEntity {
  List<LastCommentClientModel> latestUpdates = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  String fkCountry = '';
  bool sortAscending = true;
}
