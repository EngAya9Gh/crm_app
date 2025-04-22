import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../model/communication_modle.dart';

class PeriodicCommunicationPageVariablesEntity {
  List<CommunicationModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  bool get switchValue =>
      _periodicCommunicationType == PeriodicCommunicationTypeEnum.waiting;

  PeriodicCommunicationTypeEnum _periodicCommunicationType =
      PeriodicCommunicationTypeEnum.waiting;

  PeriodicCommunicationTypeEnum get periodicCommunicationType =>
      _periodicCommunicationType;

  void changePeriodicCommunicationType() {
    if (_periodicCommunicationType == PeriodicCommunicationTypeEnum.waiting) {
      _periodicCommunicationType = PeriodicCommunicationTypeEnum.evaluated;
      return;
    }
    _periodicCommunicationType = PeriodicCommunicationTypeEnum.waiting;
  }
}
