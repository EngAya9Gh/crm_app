import 'package:flutter/cupertino.dart';

import '../../data/models/important_link_model.dart';

class ImportantLinksPageVariablesEntity {
  List<ImportantLinkModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
