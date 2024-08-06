import '../../utils/end_points.dart';

enum InstallQualityTypeEnum { first, second }

extension InstallQualityTypeExtension on InstallQualityTypeEnum {
  String get value {
    switch (this) {
      case InstallQualityTypeEnum.first:
        return 'التواصل الأول';
      case InstallQualityTypeEnum.second:
        return 'التواصل الثاني';
    }
  }

  String get url {
    switch (this) {
      case InstallQualityTypeEnum.first:
        return EndPoints.care.getInstall1;
      case InstallQualityTypeEnum.second:
        return EndPoints.care.getInstall2;
    }
  }
}
