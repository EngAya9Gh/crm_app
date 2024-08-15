import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../data/models/ticket_category_model.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/ticket_sub_category_model.dart';

class TicketsPageVariablesEntity {
  List<TicketModel> allList = [];
  List<TicketModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  int currentFilterIdx = 0;

  final List<String> arTitles =
      TicketTypesEnum.values.map((e) => e.nameAr).toList();
  final List<String> enTitles =
      TicketTypesEnum.values.map((e) => e.nameEn).toList();

  List<TicketCategoryModel> allCategoriesList = [];
  List<TicketCategoryModel> selectedCategoriesList = [];

  List<TicketSubCategoryModel> allSubCategoriesList = [];
  List<TicketSubCategoryModel> filteredSubCategoriesByCategories = [];
  List<TicketSubCategoryModel> selectedSubCategoriesList = [];
}
