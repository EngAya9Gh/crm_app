enum PeriodicCommunicationClientTypeEnum {
  rare,
  offline,
  withdrawn,
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
