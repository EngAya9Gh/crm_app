import 'package:flutter/cupertino.dart';

import '../../data/models/client_contact_model.dart';

class ClientsContactsPageVariablesEntity {
  List<ClientContactModel> allList;
  int totalCount;
  bool hasReachedEnd;
  TextEditingController searchController;

  ClientsContactsPageVariablesEntity({
    this.allList = const [],
    this.totalCount = 0,
    this.hasReachedEnd = false,
    TextEditingController? searchController,
  }) : searchController = searchController ?? TextEditingController();
}
