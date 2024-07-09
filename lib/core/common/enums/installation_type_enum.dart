enum InstallationTypeEnum {
  field,
  online;

  // from string
  static InstallationTypeEnum fromString(String? value) {
    if (value == InstallationTypeEnum.field.value) {
      return InstallationTypeEnum.field;
    } else if (value == InstallationTypeEnum.online.value) {
      return InstallationTypeEnum.online;
    }
    return InstallationTypeEnum.online;
  }
}

extension InstallationTypeEnumExtension on InstallationTypeEnum {
  String get value {
    switch (this) {
      case InstallationTypeEnum.field:
        return 'ميداني';
      case InstallationTypeEnum.online:
        return 'اونلاين';
      default:
        return 'ميداني';
    }
  }
}
