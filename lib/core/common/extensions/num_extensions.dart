import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

extension NumExtensions on num {
  /* Scale */
  double get scaleFontSize => AppDimensions.scaleFontSize(toDouble());

  double get scaleHeight => AppDimensions.scaleHeight(toDouble());

  double get scaleWidth => AppDimensions.scaleWidth(toDouble());

  double get scaleIconsSize => AppDimensions.scaleIconSize(toDouble());

  /* Spacing */
  SizedBox get vertical => SizedBox(height: this.toDouble().scaleHeight);

  SizedBox get horizontal => SizedBox(width: this.toDouble().scaleWidth);

  SizedBox get height => SizedBox(height: this.toDouble());

  SizedBox get width => SizedBox(width: this.toDouble());
}
