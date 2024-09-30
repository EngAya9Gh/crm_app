import 'package:flutter/material.dart';

import '../../../../../../core/common/models/client_model.dart';

class ClientsListPageVariablesEntity {
  List<ClientModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;
  int totalPages = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
