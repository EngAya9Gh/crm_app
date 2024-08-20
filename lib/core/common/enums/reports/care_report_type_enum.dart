enum CareReportTypeEnum {
  welcome,
  quality,
  care;

  static CareReportTypeEnum? fromString(String? value) {
    switch (value) {
      case 'ترحيب':
        return CareReportTypeEnum.welcome;
      case 'جودة':
        return CareReportTypeEnum.quality;
      case 'العناية':
        return CareReportTypeEnum.care;
      default:
        return null;
    }
  }
}

extension CareReportTypeEnumExtension on CareReportTypeEnum {
  String get value {
    switch (this) {
      case CareReportTypeEnum.welcome:
        return 'ترحيب';
      case CareReportTypeEnum.quality:
        return 'جودة';
      case CareReportTypeEnum.care:
        return 'العناية';
    }
  }

  // to param
  String get toParam {
    switch (this) {
      case CareReportTypeEnum.welcome:
        return 'ترحيب';
      case CareReportTypeEnum.quality:
        return 'تركيب';
      case CareReportTypeEnum.care:
        return 'دوري';
    }
  }
}
