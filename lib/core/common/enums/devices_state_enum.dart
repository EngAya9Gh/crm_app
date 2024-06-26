enum DevicesStateEnum {
  prepare,
  ready,
  receive;

  static bool isSalesTeam(String? state) {
    return state == DevicesStateEnum.prepare.name || state == null;
  }

  DevicesStateEnum fromString(String? state) {
    if (state == DevicesStateEnum.prepare.name) {
      return DevicesStateEnum.prepare;
    } else if (state == DevicesStateEnum.ready.name) {
      return DevicesStateEnum.ready;
    } else if (state == DevicesStateEnum.receive.name) {
      return DevicesStateEnum.receive;
    } else {
      return DevicesStateEnum.prepare;
    }
  }
}

extension DevicesStateEnumExtension on DevicesStateEnum {
  String get name {
    switch (this) {
      case DevicesStateEnum.prepare:
        return 'prepare';
      case DevicesStateEnum.ready:
        return 'ready';
      case DevicesStateEnum.receive:
        return 'receive';
    }
  }
}

enum DevicesStateFilterEnum {
  all,
  hasDevices,
  preparedDevices,
}

extension DevicesStateFilterEnumExtension on DevicesStateFilterEnum {
  String get value {
    switch (this) {
      case DevicesStateFilterEnum.all:
        return 'الكل';
      case DevicesStateFilterEnum.hasDevices:
        return 'يوجد اجهزة';
      case DevicesStateFilterEnum.preparedDevices:
        return 'أجهزة تم تحضيرها';
    }
  }

  String get toParam {
    switch (this) {
      case DevicesStateFilterEnum.all:
        return '';
      case DevicesStateFilterEnum.hasDevices:
        return '1';
      case DevicesStateFilterEnum.preparedDevices:
        return '2';
    }
  }
}
