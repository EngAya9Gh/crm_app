import 'package:flutter/cupertino.dart';

import '../../../../../model/calendar/event_model.dart';
import '../../../../../model/maincitymodel.dart';

class DatesTablePageVariablesEntity {
  List<EventModel> allList = [];
  List<EventModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  List<MainCityModel> allMainCities = [];
}
