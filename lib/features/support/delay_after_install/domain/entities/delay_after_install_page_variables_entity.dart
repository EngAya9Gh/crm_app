import 'package:flutter/cupertino.dart';

import '../../../../../model/invoiceModel.dart';

class DelayAfterInstallPageVariablesEntity {
  List<InvoiceModel> allList = [];
  List<InvoiceModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
