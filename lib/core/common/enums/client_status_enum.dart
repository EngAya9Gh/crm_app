enum ClientStatusEnum {
  all,
  notReady,
  // suspend,
}

extension ClientStatusEnumExtension on ClientStatusEnum {
  String get name {
    switch (this) {
      case ClientStatusEnum.all:
        return 'الكل';
      case ClientStatusEnum.notReady:
        return 'غير جاهز';
      // case ClientStatusEnum.suspend:
      //   return 'معلق';
    }
  }

  String get toParam {
    switch (this) {
      case ClientStatusEnum.notReady:
        return 'notReady';
      // case ClientStatusEnum.suspend:
      //   return 'suspend';
      default:
        return '';
    }
  }
}
