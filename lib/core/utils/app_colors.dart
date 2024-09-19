import 'package:flutter/material.dart';

class AppColors {
  // Primary
  // static const Color primaryMain = Colors.lightBlue;
  static const Color primaryMain = Color(0xFF69B2FF);

  // static const Color primaryMain = Color(0xFF00488C);
  static const Color primaryAltLight = Color(0xFF69B2FF);
  static const Color primaryAltDark = Color(0xFF002B5E);

  // Secondary
  static const Color secondaryMain = Color(0xFFEAA916);
  static const Color secondaryAltLight = Color(0xFFFFE078);
  static const Color secondaryAltDark = Color(0xFF634E1F);

  // Text
  static const Color textPrimary = Color(0xff536485);

  // Status
  static const Color statusInfoActive = Color(0xFF00BCD4);
  static const Color statusInfoHover = Color(0xFFB2EBF2);
  static const Color statusSuccessActive = Color(0xFF4CAF50);
  static const Color statusSuccessHover = Color(0xFFC8E6C9);
  static const Color statusWarningActive = Color(0xFFFFC107);
  static const Color statusWarningHover = Color(0xFFFFF9C4);
  static const Color statusErrorActive = Color(0xFFF44336);
  static const Color statusErrorHover = Color(0xFFFFCDD2);

  // icons
  static const Color iconColor = Color(0xFF747474);

  // borders
  static const Color borderColor = Color(0xFF747474);

  // Other
  static const Color background = Color(0xFFF5F5F5);
  static const Color outlineBorder = Color(0xFFDDDDDD);
  static const Color inputLine = Color(0xFFCCCCCC);
  static const Color overlay = Color(0xFF757575);
  static const Color snackbarBackground = Color(0xFF212121);
  static const Color bodyBackground = Color(0xFFE0F7FA);
  static const Color paperCard = Color(0xFFFFFFFF);
  static const Color inactiveColor = Color(0xFFBDBDBD);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF4CAF50);
  static const Color fillColor = Color(0xFFF8F9FB);

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xfffdfbff),
      100: Color(0xffd6d5d6),
      200: Color(0xffB0B4BD),
      300: Color(0xffa6a3a6),
      400: Color(0xff959195),
      500: Color(_greyPrimaryValue),
      600: Color(0xff6f6b6f),
      700: Color(0xff575457),
      800: Color(0xff434143),
      900: Color(0xff333233),
    },
  );

  static const int _greyPrimaryValue = 0xff7a767a;
}
