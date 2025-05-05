import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterCareUsageEntity {
  FilterCareUsageEntity();

  final endFromNotifier = ValueNotifier<String?>(null);
  final endToNotifier = ValueNotifier<String?>(null);
  final startFromNotifier = ValueNotifier<String?>(null);
  final startToNotifier = ValueNotifier<String?>(null);
  final lastActivityFromNotifier = ValueNotifier<String?>(null);
  final lastActivityToNotifier = ValueNotifier<String?>(null);
  final stateNotifier = ValueNotifier<String?>(null);
  final premiumNotifier = ValueNotifier<String?>(null);
  final packageNotifier = ValueNotifier<String?>(null);
  final fkRegoinNotifier = ValueNotifier<int?>(null);
  final activityTypeFkNotifier = ValueNotifier<int?>(null);
  final shouldCommunicateNotifier = ValueNotifier<int?>(null);

  void reset() {
    endFromNotifier.value = null;
    endToNotifier.value = null;
    startFromNotifier.value = null;
    startToNotifier.value = null;
    lastActivityFromNotifier.value = null;
    lastActivityToNotifier.value = null;
    stateNotifier.value = null;
    premiumNotifier.value = null;
    packageNotifier.value = null;
    fkRegoinNotifier.value = null;
    activityTypeFkNotifier.value = null;
    shouldCommunicateNotifier.value = null;
  }

  FilterCareUsageEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterCareUsageEntity()
      ..endFromNotifier.value = this.endFromNotifier.value
      ..endToNotifier.value = this.endToNotifier.value
      ..startFromNotifier.value = this.startFromNotifier.value
      ..startToNotifier.value = this.startToNotifier.value
      ..lastActivityFromNotifier.value = this.lastActivityFromNotifier.value
      ..lastActivityToNotifier.value = this.lastActivityToNotifier.value
      ..stateNotifier.value = this.stateNotifier.value
      ..premiumNotifier.value = this.premiumNotifier.value
      ..packageNotifier.value = this.packageNotifier.value
      ..fkRegoinNotifier.value = this.fkRegoinNotifier.value
      ..activityTypeFkNotifier.value = this.activityTypeFkNotifier.value
      ..shouldCommunicateNotifier.value = this.shouldCommunicateNotifier.value;
  }

  FilterCareUsageEntity get returnToPreviousState {
    if (_previousState == null) {
      this.reset();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  List<Listenable> listenables() {
    return [
      endFromNotifier,
      endToNotifier,
      startFromNotifier,
      startToNotifier,
      lastActivityFromNotifier,
      lastActivityToNotifier,
      stateNotifier,
      premiumNotifier,
      packageNotifier,
      fkRegoinNotifier,
      activityTypeFkNotifier,
      shouldCommunicateNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return endFromNotifier.value != null ||
        endToNotifier.value != null ||
        startFromNotifier.value != null ||
        startToNotifier.value != null ||
        lastActivityFromNotifier.value != null ||
        lastActivityToNotifier.value != null ||
        stateNotifier.value != null ||
        premiumNotifier.value != null ||
        packageNotifier.value != null ||
        fkRegoinNotifier.value != null ||
        activityTypeFkNotifier.value != null ||
        shouldCommunicateNotifier.value != null;
  }
}
