enum ReportTypeEnum {
  userSum,
  dateDays,
  dateMonth,
  dateYear,
}

extension ReportTypeEnumExtension on ReportTypeEnum {
  String get toParam {
    switch (this) {
      case ReportTypeEnum.userSum:
        return 'userSum';
      case ReportTypeEnum.dateDays:
        return 'datedays';
      case ReportTypeEnum.dateMonth:
        return 'datemonth';
      case ReportTypeEnum.dateYear:
        return 'dateyear';
    }
  }
}
