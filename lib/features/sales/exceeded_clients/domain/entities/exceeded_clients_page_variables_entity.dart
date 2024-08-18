import 'package:flutter/cupertino.dart';

import '../../../../../core/common/models/client_model.dart';

class ExceededClientsPageVariablesEntity {
  List<ClientModel> allList = [];
  List<ClientModel> filteredClientsList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  List<ClientModel> selectedClientsForTransfer = [];
}
