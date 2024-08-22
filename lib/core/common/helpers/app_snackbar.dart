import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_navigator.dart';
import '../enums/toast_colors_enum.dart';

abstract class AppSnackbar {
  static void showSnakeBar(
    String message, {
    ToastColorsEnum color = ToastColorsEnum.normal,
  }) {
    final FToast fToast = FToast()
      ..init(AppNavigator.navigatorKey.currentContext!);
    fToast.showToast(
      gravity: ToastGravity.SNACKBAR,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color.color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AppText(
                message,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
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
