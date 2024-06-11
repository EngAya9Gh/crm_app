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

// color >> dark green, white green, white
extension SubscribingIntentionLevelTypeExtension
    on SubscribingIntentionLevelEnum {
  Color get color {
    switch (this) {
      case SubscribingIntentionLevelEnum.urgent:
        return Colors.red.shade800;
      case SubscribingIntentionLevelEnum.high:
        return Colors.yellow.shade800;
      case SubscribingIntentionLevelEnum.normal:
        return Colors.blue.shade800;
      case SubscribingIntentionLevelEnum.low:
        return Colors.grey.shade600;
    }
  }
}
