import 'package:flutter/cupertino.dart';

import '../../data/models/client_log_model.dart';

class ClientLogsPageVariablesEntity {
  List<ClientLogModel> allList = [];
  List<ClientLogModel> filterList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
