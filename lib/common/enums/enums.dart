enum StateStatus { initial, loading, success, failure, empty }

enum ADType { distributor, agent }

enum DateTimeEnum { date, time }

enum InstallationTypeEnum { field, online }

extension InstallationTypeExtension on InstallationTypeEnum {
  String get name {
    switch (this) {
      case InstallationTypeEnum.field:
        return 'ميداني';
      case InstallationTypeEnum.online:
        return 'اون لاين';
    }
  }
}

enum VisitsStatusEnum { finished, unfinished, canceled, scheduled }
