import 'package:flutter/material.dart';

abstract class AppConstants {
  static showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
