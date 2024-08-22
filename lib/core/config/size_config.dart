import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static const double designWidth = 375;
  static const double designHeight = 812;

  static void init(BuildContext context) {
    ScreenUtil.init(context);
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
  }

  static const double desktop = 1024;
  static const double tablet = 768;
  static const double mobile = 480;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet &&
      MediaQuery.sizeOf(context).width < desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tablet;
}
