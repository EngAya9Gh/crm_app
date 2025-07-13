import 'package:flutter/cupertino.dart';

import '../../../../finance/clients_attachments/data/models/subscribed_clients_model.dart';
import '../../data/models/ticket_category_model.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/ticket_sub_category_model.dart';

class TicketsPageVariablesEntity {
  List<TicketModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  List<TicketCategoryModel> allCategoriesList = [];
  List<TicketCategoryModel> selectedCategoriesList = [];

  List<TicketSubCategoryModel> allSubCategoriesList = [];
  List<TicketSubCategoryModel> filteredSubCategoriesByCategories = [];
  List<TicketSubCategoryModel> selectedSubCategoriesList = [];

}
