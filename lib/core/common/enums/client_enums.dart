enum ClientsClassification {
  notServedBySystem,
  differentInterest,
  wrongNumber,
  withAnotherEmployee,
  unknown,
  notResponding,
  repeated,
  differentCountry,
  other,
}

extension ClientsClassificationExtension on ClientsClassification {
  String get value {
    switch (this) {
      case ClientsClassification.notServedBySystem:
        return 'لايخدمه النظام';
      case ClientsClassification.differentInterest:
        return 'اهتمام مختلف';
      case ClientsClassification.wrongNumber:
        return 'الرقم غير صحيح';
      case ClientsClassification.withAnotherEmployee:
        return 'مع موظف آخر';
      case ClientsClassification.unknown:
        return 'غير معروف';
      case ClientsClassification.notResponding:
        return 'لا يرد';
      case ClientsClassification.repeated:
        return 'مكرر';
      case ClientsClassification.differentCountry:
        return 'دولة مختلفة';
      case ClientsClassification.other:
        return 'أخرى';
    }
  }
}

enum ClientRegistrationType {
  correct,
  wrong,
  New;

  static bool isCorrectFromString(String? value) => value == 'صحيح';

  static bool isWrongFromString(String? value) => value == 'خاطئ';

  static bool isNewFromString(String? value) => value == 'جديد';
}

extension ClientRegistrationTypeExtension on ClientRegistrationType {
  String get value {
    switch (this) {
      case ClientRegistrationType.correct:
        return 'صحيح';
      case ClientRegistrationType.wrong:
        return 'خاطئ';
      case ClientRegistrationType.New:
        return 'جديد';
    }
  }

  bool get isCorrect => this == ClientRegistrationType.correct;

  bool get isWrong => this == ClientRegistrationType.wrong;
}

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

enum TypeOfClientFilter {
  all,
  subscriber,
  negotiation,
  offer,
  excluded,
  withdrawn,
  suspendedExclusion,
}

extension TypeOfClientFilterExtension on TypeOfClientFilter {
  String get value {
    switch (this) {
      case TypeOfClientFilter.all:
        return 'الكل';
      case TypeOfClientFilter.subscriber:
        return 'مشترك';
      case TypeOfClientFilter.negotiation:
        return 'تفاوض';
      case TypeOfClientFilter.offer:
        return 'عرض سعر';
      case TypeOfClientFilter.excluded:
        return 'مستبعد';
      case TypeOfClientFilter.withdrawn:
        return 'منسحب';
      case TypeOfClientFilter.suspendedExclusion:
        return 'معلق استبعاد';
    }
  }
}
