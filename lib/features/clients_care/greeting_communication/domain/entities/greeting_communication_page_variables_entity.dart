import 'package:flutter/cupertino.dart';

import '../../../../../model/communication_modle.dart';

class GreetingCommunicationPageVariablesEntity {
  List<CommunicationModel> allList = [];
  List<CommunicationModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
