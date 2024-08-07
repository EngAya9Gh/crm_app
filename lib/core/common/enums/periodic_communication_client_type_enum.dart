enum PeriodicCommunicationClientTypeEnum {
  rare,
  offline,
  withdrawn;

  static PeriodicCommunicationClientTypeEnum? fromString(String? value) {
    if (rare.value == value || rare.name == value) {
      return rare;
    } else if (offline.value == value || offline.name == value) {
      return offline;
    } else if (withdrawn.value == value || withdrawn.name == value) {
      return withdrawn;
    }
    return null;
  }
}

extension PeriodicCommunicationClientTypeEnumExtension
    on PeriodicCommunicationClientTypeEnum {
  String get value {
    switch (this) {
      case PeriodicCommunicationClientTypeEnum.rare:
        return 'نادر الاستخدام';
      case PeriodicCommunicationClientTypeEnum.offline:
        return 'يستخدم الأوفلاين';
      case PeriodicCommunicationClientTypeEnum.withdrawn:
        return 'منسحب';
    }
  }

  bool get isWithdrawn => this == PeriodicCommunicationClientTypeEnum.withdrawn;
}
