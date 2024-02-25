import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_vm_provider.dart';

abstract class AppConstants {
  static const Size designSize = Size(375, 812);

  static const int kPerPage = 20;

  static String? currentUserId(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.idUser;

  static String? currentCountry(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;

  static showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
