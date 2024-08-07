import 'package:flutter/material.dart';

import '../../../../../core/common/enums/previous_ratings_type_enum.dart';
import '../../../../../model/communication_modle.dart';

class PreviousRatingsPageVariablesEntity {
  List<CommunicationModel> allList = [];
  List<CommunicationModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  PreviousRatingsTypeEnum _typeCommunication = PreviousRatingsTypeEnum.install1;

  PreviousRatingsTypeEnum get typeCommunication => _typeCommunication;

  bool changeTypeCommunication(int index) {
    final newType = PreviousRatingsTypeEnum.fromIndex(index);
    final doRefresh = newType != _typeCommunication;
    _typeCommunication = newType;
    return doRefresh;
  }
}
