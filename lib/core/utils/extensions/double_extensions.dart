import '../app_dimensions.dart';

extension DoubleExtensions on double {
  double get scaleFontSize => AppDimensions.scaleFontSize(this);

  double get scaleHeight => AppDimensions.scaleHeight(this);

  double get scaleWidth => AppDimensions.scaleWidth(this);

  double get scaleIconsSize => AppDimensions.scaleIconSize(this);
}
