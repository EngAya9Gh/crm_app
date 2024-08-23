import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/models/location/city_model.dart';
import '../../../../../../model/usermodel.dart';

class FilterClientsListEntity {
  FilterClientsListEntity();

  ValueNotifier<String?> regionIdNotifier = ValueNotifier<String?>(null);
  ValueNotifier<int?> activityNotifier = ValueNotifier<int?>(null);
  ValueNotifier<ActivitySizeTypeEnum?> activitySizeNotifier =
      ValueNotifier<ActivitySizeTypeEnum?>(null);
  ValueNotifier<ClientSourceEnum?> clientSourceNotifier =
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
  ValueNotifier<CityModel?> cityNotifier = ValueNotifier<CityModel?>(null);

  void clearFilters() {
    regionIdNotifier.value = null;
    activityNotifier.value = null;
    activitySizeNotifier.value = null;
    userNotifier.value = null;
    recordTypeNotifier.value = null;
    classTypeNotifier.value = null;
    statusNotifier.value = <String>[];
    fromController.clear();
    toController.clear();
    clientSourceNotifier.value = null;
    subscribingIntentionLevel.value = null;
    isSwitchOnNotifier.value = false;
    clientSourceNotifier.value = null;
    cityNotifier.value = null;
  }

  FilterClientsListEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterClientsListEntity()
      ..regionIdNotifier.value = this.regionIdNotifier.value
      ..activityNotifier.value = this.activityNotifier.value
      ..activitySizeNotifier.value = this.activitySizeNotifier.value
      ..userNotifier.value = this.userNotifier.value
      ..recordTypeNotifier.value = this.recordTypeNotifier.value
      ..classTypeNotifier.value = this.classTypeNotifier.value
      ..statusNotifier.value = this.statusNotifier.value
      ..fromController.text = this.fromController.text
      ..toController.text = this.toController.text
      ..clientSourceNotifier.value = this.clientSourceNotifier.value
      ..subscribingIntentionLevel.value = this.subscribingIntentionLevel.value
      ..isSwitchOnNotifier.value = this.isSwitchOnNotifier.value
      ..clientSourceNotifier.value = this.clientSourceNotifier.value
      ..cityNotifier.value = this.cityNotifier.value;
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
      regionIdNotifier,
      activityNotifier,
      activitySizeNotifier,
      userNotifier,
      recordTypeNotifier,
      classTypeNotifier,
      statusNotifier,
      fromController,
      toController,
      clientSourceNotifier,
      subscribingIntentionLevel,
      isSwitchOnNotifier,
      clientSourceNotifier,
      cityNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return regionIdNotifier.value != null ||
        activityNotifier.value != null ||
        activitySizeNotifier.value != null ||
        userNotifier.value != null ||
        recordTypeNotifier.value != null ||
        classTypeNotifier.value != null ||
        statusNotifier.value.isNotEmpty ||
        fromController.text.isNotEmpty ||
        toController.text.isNotEmpty ||
        clientSourceNotifier.value != null ||
        subscribingIntentionLevel.value != null ||
        isSwitchOnNotifier.value ||
        clientSourceNotifier.value != null ||
        cityNotifier.value != null;
  }
}
