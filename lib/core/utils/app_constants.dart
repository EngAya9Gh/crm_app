import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../../model/usermodel.dart';

abstract class AppConstants {
  static const int kPerPage = 15;

  static const String canceledByUserError = "canceled_by_user";

  static bool shouldReturnEarly(dynamic error) => error == canceledByUserError;

  static Future<bool> isInternetConnected() async =>
      await ConnectivityWrapper.instance.isConnected;

  static late UserModel currentUser;

  static String get currentCountry => currentUser.fkCountry ?? '1';

  static const int snackbarDuration = 2;

  static void debounceFunction(
    Function() action, {
    required String tag,
    Duration? duration,
    bool isDebounced = true,
  }) {
    EasyDebounce.debounce(
      tag,
      duration ?? Duration(milliseconds: isDebounced ? 600 : 0),
      action,
    );
  }

  static Future<dynamic> showAppDialog({
    required Widget child,
    final String? title,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
  }) async {
    return await showDialog(
      context: AppNavigator.navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
