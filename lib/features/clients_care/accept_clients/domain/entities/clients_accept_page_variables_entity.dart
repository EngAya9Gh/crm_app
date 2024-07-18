import 'package:flutter/cupertino.dart';

import '../../../../../model/clientmodel.dart';

class ClientsAcceptPageVariablesEntity {
  List<ClientModel1> clientsList = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
