enum UsageClientTypeEnum {
  rare,
  online,
  notusing;

  static UsageClientTypeEnum? fromString(String? value) {
    if (rare.value == value || rare.name == value) {
      return rare;
    } else if (online.value == value || online.name == value) {
      return online;
    } else if (notusing.value == value || notusing.name == value) {
      return notusing;
    }
    return null;
  }
}

extension UsageClientTypeEnumExtension
on UsageClientTypeEnum {
  String get value {
    switch (this) {
      case UsageClientTypeEnum.online:
        return 'أونلاين';
      case UsageClientTypeEnum.rare:
        return 'نادر الاستخدام';
      case UsageClientTypeEnum.notusing:
        return 'لا يستخدم النظام';
    }
  }

}