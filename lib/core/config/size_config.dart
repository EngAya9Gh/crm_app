import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static final double designWidth = kIsWeb ? 1920 : 375;
  static final double designHeight = kIsWeb ? 1080 : 812;

  static void init(BuildContext context) {
    ScreenUtil.init(context);
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
  }

  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1024;
  static const double desktopMedium = 1200;
  static const double desktopLarge = 1440;
  static const double desktopXLarge = 1920;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tablet;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet &&
      MediaQuery.sizeOf(context).width < desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;

  static bool isDesktopLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopLarge;

  static bool isDesktopXLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopXLarge;
}
