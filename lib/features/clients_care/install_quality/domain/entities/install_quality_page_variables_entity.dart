import 'package:flutter/cupertino.dart';

import '../../../../../core/common/enums/install_quality_type_enum.dart';
import '../../../../../model/communication_modle.dart';

class InstallQualityPageVariablesEntity {
  List<CommunicationModel> allList = [];
  List<CommunicationModel> filteredList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  bool get switchValue => _installQualityType == InstallQualityTypeEnum.first;

  InstallQualityTypeEnum _installQualityType = InstallQualityTypeEnum.first;

  InstallQualityTypeEnum get installQualityType => _installQualityType;

  void changeInstallQualityType() {
    if (_installQualityType == InstallQualityTypeEnum.first) {
      _installQualityType = InstallQualityTypeEnum.second;
      return;
    }
    _installQualityType = InstallQualityTypeEnum.first;
  }
}
