enum ActivitySizeTypeEnum { large, medium, small }

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
