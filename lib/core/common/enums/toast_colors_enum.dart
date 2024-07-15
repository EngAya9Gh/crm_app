import 'package:flutter/material.dart';

enum ToastColorsEnum {
  normal,
  success,
  error,
  warning,
  info,
}

extension ToastColorsEnumExtension on ToastColorsEnum {
  Color get color {
    switch (this) {
      case ToastColorsEnum.normal:
        return Colors.grey.shade900;
      case ToastColorsEnum.success:
        return Colors.green;
      case ToastColorsEnum.error:
        return Colors.red;
      case ToastColorsEnum.warning:
        return Colors.orange;
      case ToastColorsEnum.info:
        return Colors.blue;
      default:
        return Colors.grey.shade900;
    }
  }
}
