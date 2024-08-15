import 'package:flutter/cupertino.dart';

import '../../../../../model/invoiceModel.dart';

class SupportClientsInvoicesPageVariablesEntity {
  List<InvoiceModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
