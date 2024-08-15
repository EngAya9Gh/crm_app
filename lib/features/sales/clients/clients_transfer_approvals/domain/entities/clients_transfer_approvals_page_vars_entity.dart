import 'package:flutter/cupertino.dart';

import '../../../../../../core/common/models/client_model.dart';

class ClientsTransferApprovalsPageVarsEntity {
  List<ClientModel> allList = [];
  List<ClientModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
