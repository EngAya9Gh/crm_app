import 'package:flutter/cupertino.dart';

import '../../../../../core/common/models/client_model.dart';

class ClientsAcceptPageVariablesEntity {
  List<ClientModel> clientsList = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
