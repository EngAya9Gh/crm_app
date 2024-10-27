import 'dart:async';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../../model/usermodel.dart';
// import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

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
    if (kIsWeb) {
      // html.window.history.pushState(null, '', html.window.location.href);
    }
    final completer = Completer<dynamic>();

    showDialog(
      context: AppNavigator.navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return child;
      },
    ).then((value) {
      // When the dialog is closed normally, complete the completer
      if (!completer.isCompleted) {
        completer.complete(value);
      }
    });

    // Listen for popstate events
    void popStateListener(_) {
      // Close the dialog if it's still open
      if (!completer.isCompleted) {
        Navigator.of(AppNavigator.navigatorKey.currentContext!, rootNavigator: useRootNavigator).pop();
        completer.complete(null);
      }
      // Remove the listener
      if (kIsWeb) {
        // html.window.removeEventListener('popstate', popStateListener);

      }
    }

    // Add the popstate listener
    if (kIsWeb) {
      // html.window.addEventListener('popstate', popStateListener);

    }

    // Wait for the dialog to complete and return the result
    return completer.future;


    // return await showDialog(
    //   context: AppNavigator.navigatorKey.currentContext!,
    //   barrierDismissible: barrierDismissible,
    //   useRootNavigator: useRootNavigator,
    //   builder: (BuildContext context) {
    //     return child;
    //   },
    // );
  }
}
