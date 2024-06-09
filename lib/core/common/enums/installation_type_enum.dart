enum InstallationTypeEnum {
  field,
  online,
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
