enum ActivitySizeType { large, medium, small }

extension ActivitySizeTypeExt on ActivitySizeType {
  String get value {
    switch (this) {
      case ActivitySizeType.large:
        return 'كبير';
      case ActivitySizeType.medium:
        return 'متوسط';
      case ActivitySizeType.small:
        return 'صغير';
    }
  }
}