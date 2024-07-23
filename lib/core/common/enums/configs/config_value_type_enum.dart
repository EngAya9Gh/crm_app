enum ConfigValueTypeEnum {
  percentage,
  hour,
  day,
  currency;

  static ConfigValueTypeEnum? fromString(String? value) {
    if (value == ConfigValueTypeEnum.percentage.name) {
      return ConfigValueTypeEnum.percentage;
    } else if (value == ConfigValueTypeEnum.hour.name) {
      return ConfigValueTypeEnum.hour;
    } else if (value == ConfigValueTypeEnum.day.name) {
      return ConfigValueTypeEnum.day;
    } else if (value == ConfigValueTypeEnum.currency.name) {
      return ConfigValueTypeEnum.currency;
    }
    return null;
  }
}

extension ConfigValueTypeEnumExtension on ConfigValueTypeEnum {
  String get value {
    switch (this) {
      case ConfigValueTypeEnum.percentage:
        return '%';
      case ConfigValueTypeEnum.hour:
        return 'ساعة';
      case ConfigValueTypeEnum.day:
        return 'يوم';
      case ConfigValueTypeEnum.currency:
        return '\$';
    }
  }
}
