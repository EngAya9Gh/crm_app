import 'package:flutter/cupertino.dart';

import '../../../../../core/common/models/client_model.dart';

class ExceededClientsPageVariablesEntity {
  List<ClientModel> allClientsList = [];
  List<ClientModel> filteredClientsList = [];
  TextEditingController searchController = TextEditingController();
  int totalClientsCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
