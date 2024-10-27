import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violations_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/common/models/client_model.dart';

class ViolationsPageVarsEntity {
  List<Violations_Model> allList = [];
  List<Violations_Model> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
