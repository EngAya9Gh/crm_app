import 'package:flutter/cupertino.dart';

import '../../data/models/privilege_model.dart';

class PrivilegesPageVariablesEntity {
  List<PrivilegeModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
