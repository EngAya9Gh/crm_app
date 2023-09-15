import 'package:flutter/material.dart';

extension StateExt on State {
  ThemeData get theme => Theme.of(context);
  TextTheme get textTheme => Theme.of(context).textTheme;
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
}