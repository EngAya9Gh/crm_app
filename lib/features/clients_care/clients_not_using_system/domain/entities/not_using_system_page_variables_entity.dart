import 'package:flutter/cupertino.dart';

import '../../../../../model/communication_modle.dart';

class NotUsingSystemPageVariablesEntity {
  List<CommunicationModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
