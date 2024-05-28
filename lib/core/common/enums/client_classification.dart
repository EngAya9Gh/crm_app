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
