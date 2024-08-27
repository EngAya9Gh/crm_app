import 'package:flutter/cupertino.dart';

import '../../../../../core/common/models/client_model.dart';

class ClientsSupportAcceptPageVariablesEntity {
  List<ClientModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
