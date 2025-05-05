import 'package:flutter/material.dart';

import '../../../care_usage_efficiency/data/models/care_usage_model.dart';

class CareUsagePageVariablesEntity {
  CareUsagePageVariablesEntity();

  List<CareUsageModel> allList = [];
  bool hasReachedEnd = false;
  int totalCount = 0;
  bool isNewFilter = true;
  int shouldCommunicate = 0;
  TextEditingController searchController = TextEditingController();
}
