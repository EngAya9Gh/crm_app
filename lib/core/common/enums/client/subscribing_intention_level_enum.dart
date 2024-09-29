import 'package:flutter/material.dart';

enum SubscribingIntentionLevelEnum {
  urgent,
  high,
  normal,
  low;

  static SubscribingIntentionLevelEnum? fromString(String? value) {
    if (value == SubscribingIntentionLevelEnum.urgent.name) {
      return SubscribingIntentionLevelEnum.urgent;
    } else if (value == SubscribingIntentionLevelEnum.high.name) {
      return SubscribingIntentionLevelEnum.high;
    } else if (value == SubscribingIntentionLevelEnum.normal.name) {
      return SubscribingIntentionLevelEnum.normal;
    } else if (value == SubscribingIntentionLevelEnum.low.name) {
      return SubscribingIntentionLevelEnum.low;
    } else {
      return null;
    }
  }
}

extension SubscribingIntentionLevelTypeExtension
    on SubscribingIntentionLevelEnum {
  String get value {
    return switch (this) {
      SubscribingIntentionLevelEnum.urgent => 'غير مؤجل',
      SubscribingIntentionLevelEnum.high => 'مرتفع',
      SubscribingIntentionLevelEnum.normal => 'عادي',
      SubscribingIntentionLevelEnum.low => 'منخفض',
    };
  }

  Color get color {
    return switch (this) {
      SubscribingIntentionLevelEnum.urgent => Colors.red.shade800,
      SubscribingIntentionLevelEnum.high => Colors.yellow.shade800,
      SubscribingIntentionLevelEnum.normal => Colors.blue.shade800,
      SubscribingIntentionLevelEnum.low => Colors.grey.shade600,
    };
  }
}
