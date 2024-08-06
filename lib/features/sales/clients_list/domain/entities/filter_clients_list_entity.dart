import 'package:flutter/material.dart';

import '../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../model/usermodel.dart';

class FilterClientsListEntity {
  FilterClientsListEntity();

  ValueNotifier<int?> regionNotifier = ValueNotifier<int?>(null);
  ValueNotifier<int?> activityNotifier = ValueNotifier<int?>(null);
  ValueNotifier<ActivitySizeTypeEnum?> activitySizeNotifier =
      ValueNotifier<ActivitySizeTypeEnum?>(null);
  ValueNotifier<ClientSourceEnum?> filterSourceClientNotifier =
      ValueNotifier<ClientSourceEnum?>(null);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier<UserModel?>(null);
  ValueNotifier<List<String?>> statusNotifier =
      ValueNotifier<List<String?>>([]);

  ValueNotifier<String?> recordTypeNotifier = ValueNotifier<String?>(null);
  ValueNotifier<String?> classTypeNotifier = ValueNotifier<String?>(null);
  ValueNotifier<String?> subscribingIntentionLevel =
      ValueNotifier<String?>(null);
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  ValueNotifier<bool> isSwitchOnNotifier = ValueNotifier<bool>(false);

  void clearFilters() {
    regionNotifier.value = null;
    activityNotifier.value = null;
    activitySizeNotifier.value = null;
    userNotifier.value = null;
    recordTypeNotifier.value = null;
    classTypeNotifier.value = null;
    statusNotifier.value = <String>[];
    fromController.clear();
    toController.clear();
    filterSourceClientNotifier.value = null;
    subscribingIntentionLevel.value = null;
    isSwitchOnNotifier.value = false;
  }

  FilterClientsListEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsListEntity()
      ..regionNotifier.value = this.regionNotifier.value
      ..activityNotifier.value = this.activityNotifier.value
      ..activitySizeNotifier.value = this.activitySizeNotifier.value
      ..userNotifier.value = this.userNotifier.value
      ..recordTypeNotifier.value = this.recordTypeNotifier.value
      ..classTypeNotifier.value = this.classTypeNotifier.value
      ..statusNotifier.value = this.statusNotifier.value
      ..fromController.text = this.fromController.text
      ..toController.text = this.toController.text
      ..filterSourceClientNotifier.value = this.filterSourceClientNotifier.value
      ..subscribingIntentionLevel.value = this.subscribingIntentionLevel.value
      ..isSwitchOnNotifier.value = this.isSwitchOnNotifier.value;
  }

  FilterClientsListEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      regionNotifier,
      activityNotifier,
      activitySizeNotifier,
      userNotifier,
      recordTypeNotifier,
      classTypeNotifier,
      statusNotifier,
      fromController,
      toController,
      filterSourceClientNotifier,
      subscribingIntentionLevel,
      isSwitchOnNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return regionNotifier.value != null ||
        activityNotifier.value != null ||
        activitySizeNotifier.value != null ||
        userNotifier.value != null ||
        recordTypeNotifier.value != null ||
        classTypeNotifier.value != null ||
        statusNotifier.value.isNotEmpty ||
        fromController.text.isNotEmpty ||
        toController.text.isNotEmpty ||
        filterSourceClientNotifier.value != null ||
        subscribingIntentionLevel.value != null ||
        isSwitchOnNotifier.value;
  }
}
