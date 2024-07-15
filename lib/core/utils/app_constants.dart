import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/utils/custom_toast_body.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../model/usermodel.dart';
import '../../view_model/user_vm_provider.dart';
import '../common/enums/toast_colors_enum.dart';

abstract class AppConstants {
  static const Size designSize = Size(375, 812);

  static const int kPerPage = 15;

  static Future<bool> isInternetConnected() async =>
      await ConnectivityWrapper.instance.isConnected;

  static UserModel? currentUser(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser;

  static String? currentCountry(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;

  static void showSnakeBar(
    BuildContext context,
    String message, {
    ToastColorsEnum color = ToastColorsEnum.normal,
  }) async {
    final FToast fToast = FToast()..init(context);
    fToast.showToast(
      child: CustomToastBody(message: message, color: color),
      gravity: ToastGravity.SNACKBAR,
      toastDuration: Duration(seconds: 2),
    );
  }
}
