import 'package:flutter/cupertino.dart';

import '../../data/models/client_log_model.dart';

class ClientLogsPageVariablesEntity {
  List<ClientDayLogsModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
