enum ReportTypeEnum {
  userSum,
  dateDays,
  dateMonth,
  dateYear,
  allRegion,
  users,
  region;

  static ReportTypeEnum? fromString(String value) {
    print("value: => $value");
    if (value == ReportTypeEnum.userSum.name) {
      return ReportTypeEnum.userSum;
    } else if (value == ReportTypeEnum.dateDays.name) {
      return ReportTypeEnum.dateDays;
    } else if (value == ReportTypeEnum.dateMonth.name) {
      return ReportTypeEnum.dateMonth;
    } else if (value == ReportTypeEnum.dateYear.name) {
      return ReportTypeEnum.dateYear;
    } else if (value == ReportTypeEnum.allRegion.name) {
      return ReportTypeEnum.allRegion;
    } else if (value == ReportTypeEnum.users.name) {
      return ReportTypeEnum.users;
    } else if (value == ReportTypeEnum.region.name) {
      return ReportTypeEnum.region;
    }
    return null;
  }
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
