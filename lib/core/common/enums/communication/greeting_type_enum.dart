enum GreetingTypeEnum {
  all,
  welcomed,
  notWelcomed,
}

extension GreetingTypeEnumExtension on GreetingTypeEnum {
  String get value {
    switch (this) {
      case GreetingTypeEnum.all:
        return 'الكل';
      case GreetingTypeEnum.welcomed:
        return 'تم الترحيب';
      case GreetingTypeEnum.notWelcomed:
        return 'لم يتم الترحيب';
    }
  }

  // to param
  String? toParam() {
    switch (this) {
      case GreetingTypeEnum.all:
        return null;
      case GreetingTypeEnum.welcomed:
        return 'done';
      case GreetingTypeEnum.notWelcomed:
        return 'wait';
    }
  }
}
