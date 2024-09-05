import 'package:flutter/cupertino.dart';

import '../../../../../core/common/models/client_model.dart';

class ClientsAcceptPageVariablesEntity {
  List<ClientModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
