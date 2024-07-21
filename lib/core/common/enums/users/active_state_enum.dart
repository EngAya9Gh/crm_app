enum ActiveStateEnum {
  all,
  active,
  inactive,
}

extension ActiveStateEnumExtension on ActiveStateEnum {
  String get value {
    switch (this) {
      case ActiveStateEnum.all:
        return 'الكل';
      case ActiveStateEnum.active:
        return 'نشط';
      case ActiveStateEnum.inactive:
        return 'غير نشط';
    }
  }

  String? toParam() {
    switch (this) {
      case ActiveStateEnum.all:
        return null;
      case ActiveStateEnum.active:
        return 'نشط';
      case ActiveStateEnum.inactive:
        return 'غير نشط';
    }
  }
}
