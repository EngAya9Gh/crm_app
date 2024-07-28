enum ActivitySizeTypeEnum {
  large,
  medium,
  small;

  static ActivitySizeTypeEnum? fromString(String? value) {
    if (value == ActivitySizeTypeEnum.large.value) {
      return ActivitySizeTypeEnum.large;
    } else if (value == ActivitySizeTypeEnum.medium.value) {
      return ActivitySizeTypeEnum.medium;
    } else if (value == ActivitySizeTypeEnum.small.value) {
      return ActivitySizeTypeEnum.small;
    }
    return null;
  }
}

extension ActivitySizeTypeExt on ActivitySizeTypeEnum {
  String get value {
    switch (this) {
      case ActivitySizeTypeEnum.large:
        return 'كبير';
      case ActivitySizeTypeEnum.medium:
        return 'متوسط';
      case ActivitySizeTypeEnum.small:
        return 'صغير';
    }
  }
}
