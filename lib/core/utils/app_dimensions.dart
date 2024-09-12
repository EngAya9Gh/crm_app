import 'package:flutter/material.dart';

import '../config/navigator/app_navigator.dart';
import '../config/size_config.dart';

abstract class AppDimensions {
  static currentWidth() {
    return MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;
  }

  static currentHeight() {
    return MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).height;
  }

  static double scaleHeight(double height) {
    final double scaleFactor = getScaleFactor();
    final double responsiveHeight = height * scaleFactor;

    final double lowerLimit = height * .9;
    final double upperLimit = height * 1.2;

    return responsiveHeight.clamp(lowerLimit, upperLimit);
  }

  static double scaleWidth(double width) {
    final double scaleFactor = getScaleFactor();
    final double responsiveWidth = width * scaleFactor;

    final double lowerLimit = width * .9;
    final double upperLimit = width * 1.2;

    return responsiveWidth.clamp(lowerLimit, upperLimit);
  }

  static double scaleFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .9;
    double upperLimit = fontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double scaleImageSize(double imageSize) {
    final double scaleFactor = getScaleFactor();
    final double responsiveImageSize = imageSize * scaleFactor;

    final double minSize = imageSize * .8;
    final double maxSize = imageSize * 1.0;

    return responsiveImageSize.clamp(minSize, maxSize);
  }

  static double scaleIconSize(double iconSize) {
    final double scaleFactor = getScaleFactor();
    final double responsiveIconSize = iconSize * scaleFactor;

    final double minSize = iconSize * .8;
    final double maxSize = iconSize * 1.0;

    return responsiveIconSize.clamp(minSize, maxSize);
  }

  static int scaleGridCount() {
    double width =
        MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;
    if (width < SizeConfig.mobile) {
      return 2;
    } else if (width < SizeConfig.tablet) {
      return 3;
    } else {
      return 4;
    }
  }

  static double getScaleFactor() {
    double width =
        MediaQuery.sizeOf(AppNavigator.navigatorKey.currentContext!).width;

    if (width < SizeConfig.mobile) {
      return width / 480;
    } else if (width < SizeConfig.tablet) {
      return width / 768;
    } else if (width < SizeConfig.desktop) {
      return width / 1024;
    } else if (width < SizeConfig.desktopLarge) {
      return width / 1440;
    } else {
      return width / 2560;
    }
  }

  static const double kbrBorderTextField = 10;
}
