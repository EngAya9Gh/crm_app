enum PeriodTypeEnum {
  yearly,
  monthly,
  daily;

  static PeriodTypeEnum? fromString(String? value) {
    if (value == PeriodTypeEnum.yearly.name) {
      return PeriodTypeEnum.yearly;
    } else if (value == PeriodTypeEnum.monthly.name) {
      return PeriodTypeEnum.monthly;
    } else if (value == PeriodTypeEnum.daily.name) {
      return PeriodTypeEnum.daily;
    }
    return null;
  }
}

extension PeriodTypeEnumExtension on PeriodTypeEnum {
  String get value {
    switch (this) {
      case PeriodTypeEnum.yearly:
        return 'سنوي';
      case PeriodTypeEnum.monthly:
        return 'شهري';
      case PeriodTypeEnum.daily:
        return 'يومي';
    }
  }

  bool get isDaily => this == PeriodTypeEnum.daily;

  bool get isMonthly => this == PeriodTypeEnum.monthly;

  bool get isYearly => this == PeriodTypeEnum.yearly;
}
