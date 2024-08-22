import 'package:flutter/material.dart';

import '../../../../core/common/enums/notifications/notification_type_enum.dart';

class FilterNotificationsEntity {
  FilterNotificationsEntity() {
    dateFromController.addListener(() {
      dateFromNotifier.value = dateFromController.text;
    });
    dateToController.addListener(() {
      dateToNotifier.value = dateToController.text;
    });
  }

  ValueNotifier<NotificationTypeEnum?> notificationTypeNotifier =
      ValueNotifier<NotificationTypeEnum?>(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  ValueNotifier<String> dateFromNotifier = ValueNotifier<String>('');
  ValueNotifier<String> dateToNotifier = ValueNotifier<String>('');

  void clearFilters() {
    notificationTypeNotifier.value = null;
    dateFromController.clear();
    dateToController.clear();
  }

  FilterNotificationsEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterNotificationsEntity()
      ..notificationTypeNotifier.value = this.notificationTypeNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text;
  }

  FilterNotificationsEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      notificationTypeNotifier,
      dateFromNotifier,
      dateToNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return notificationTypeNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty;
  }
}
