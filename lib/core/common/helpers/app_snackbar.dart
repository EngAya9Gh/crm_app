import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../config/navigator/app_navigator.dart';
import '../../utils/app_constants.dart';
import '../enums/toast_colors_enum.dart';

abstract class AppSnackbar {
  static void showSnakeBar(
    String? message, {
    ToastColorsEnum color = ToastColorsEnum.normal,
  }) {
    final context = AppNavigator.navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(
            message ?? 'حدث خطأ ما',
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          backgroundColor: color.color,
          duration: Duration(seconds: AppConstants.snackbarDuration),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  }

  static void showListOfSnackBars({
    required List<String> snackbarsMessages,
    required VoidCallback onCompletion,
  }) {
    snackbarsMessages.forEach((message) {
      showSnakeBar(message);
    });

    final time = AppConstants.snackbarDuration * snackbarsMessages.length + 1;
    Future.delayed(Duration(seconds: time), onCompletion);
  }
}
