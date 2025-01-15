import 'package:flutter/material.dart';

import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../model/usermodel.dart';

class FilterDatesTableEntity {
  FilterDatesTableEntity();

  ValueNotifier<List<RegionModel>?> mainCitiesNotifier = ValueNotifier(null);
  ValueNotifier<bool> isAllEventsNotifier = ValueNotifier(true);
  ValueNotifier<UserModel?> userNotifier = ValueNotifier(null);
  ValueNotifier<SellerTypeEnum?> type = ValueNotifier(null);

  void clear() {
    mainCitiesNotifier.value = null;
    isAllEventsNotifier.value = true;
    userNotifier.value = null;
    type.value = null;
  }

  FilterDatesTableEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterDatesTableEntity()
      ..mainCitiesNotifier.value = mainCitiesNotifier.value
      ..isAllEventsNotifier.value = isAllEventsNotifier.value
      ..userNotifier.value = userNotifier.value
      ..type.value = type.value;
  }

  FilterDatesTableEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clear();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      mainCitiesNotifier,
      isAllEventsNotifier,
      userNotifier,
      type,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return mainCitiesNotifier.value != null ||
        !isAllEventsNotifier.value ||
        userNotifier.value != null||
        type.value != null;
  }
}
