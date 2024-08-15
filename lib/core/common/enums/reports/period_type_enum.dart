enum PeriodTypeEnum {
  yearly,
  monthly,
  daily,
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
