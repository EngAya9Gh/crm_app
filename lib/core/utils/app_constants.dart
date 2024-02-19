import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/user_vm_provider.dart';

abstract class AppConstants {
  static String? currentCountry(BuildContext context) =>
      Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;

  static showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
