enum ClientDebtTypeEnum {
  all,
  users,
  region;
}

extension ClientDebtTypeEnumExtension on ClientDebtTypeEnum {
  String get toParam {
    switch (this) {
      case ClientDebtTypeEnum.all:
        return 'all';

      case ClientDebtTypeEnum.users:
        return 'users';

      case ClientDebtTypeEnum.region:
        return 'regoin';
    }
  }
}
