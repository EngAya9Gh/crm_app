import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/usermodel.dart';
import '../../view_model/user_vm_provider.dart';

abstract class AppConstants {
  static const Size designSize = Size(375, 812);

  static const int kPerPage = 15;

  static Future<bool> isInternetConnected() async =>
      await ConnectivityWrapper.instance.isConnected;

  static UserModel? currentUser(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser;

  static String? currentCountry(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;

  static void showSnackBarAsBottomSheet(
    BuildContext context,
    String message, {
    int? maxLines,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return Container(
          height: 50,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              message,
              textDirection: TextDirection.rtl,
              textScaler: TextScaler.linear(1),
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
