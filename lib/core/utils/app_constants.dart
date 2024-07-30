import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../model/usermodel.dart';
import '../../view_model/user_vm_provider.dart';
import '../common/enums/toast_colors_enum.dart';
import 'custom_toast_body.dart';

abstract class AppConstants {
  static const Size designSize = Size(375, 812);

  static const int kPerPage = 15;

  static Future<bool> isInternetConnected() async =>
      await ConnectivityWrapper.instance.isConnected;

  static UserModel? currentUser(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser;

  static String? currentCountry(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;

  static const int snackbarDuration = 2;
  static void showSnakeBar(
    String message, {
    ToastColorsEnum color = ToastColorsEnum.normal,
  }) {
    final FToast fToast = FToast()
      ..init(AppNavigator.navigatorKey.currentContext!);
    fToast.showToast(
      child: CustomToastBody(message: message, color: color),
      gravity: ToastGravity.SNACKBAR,
      toastDuration: Duration(seconds: snackbarDuration),
    );
  }

  static void debounceFunction(
    Function() action, {
    required String tag,
    Duration? duration,
  }) {
    EasyDebounce.debounce(
      tag,
      duration ?? Duration(milliseconds: 500),
      action,
    );
  }
}
