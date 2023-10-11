part of 'theme.dart';

abstract class AppColors {
  const AppColors._();

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      500: Color(_primaryPrimaryValue),
    },
  );

  static const int _primaryPrimaryValue = 0xffD81F72;

  static const MaterialColor dark = MaterialColor(
    _darkPrimaryValue,
    <int, Color>{
      500: Color(_darkPrimaryValue),
    },
  );

  static const int _darkPrimaryValue = 0xff142550;

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

  static const Color backgroundDark = Color(0xFF001B3D);
  static const Color green = Color(0xFF4ADA63);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
