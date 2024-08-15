enum ReportTypeEnum {
  userSum,
  dateDays,
  dateMonth,
  dateYear,
  allRegion,
  users,
  region,
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
      case ReportTypeEnum.allRegion:
        return 'allregoin';
      case ReportTypeEnum.users:
        return 'users';
      case ReportTypeEnum.region:
        return 'regoin';
    }
  }
}
