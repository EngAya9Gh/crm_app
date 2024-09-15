enum ClientsClassification {
  notServedBySystem,
  differentInterest,
  wrongNumber,
  withAnotherEmployee,
  unknown,
  notResponding,
  repeated,
  differentCountry,
  other;

  static ClientsClassification? fromString(String? value) {
    if (value == ClientsClassification.notServedBySystem.value) {
      return ClientsClassification.notServedBySystem;
    } else if (value == ClientsClassification.differentInterest.value) {
      return ClientsClassification.differentInterest;
    } else if (value == ClientsClassification.wrongNumber.value) {
      return ClientsClassification.wrongNumber;
    } else if (value == ClientsClassification.withAnotherEmployee.value) {
      return ClientsClassification.withAnotherEmployee;
    } else if (value == ClientsClassification.unknown.value) {
      return ClientsClassification.unknown;
    } else if (value == ClientsClassification.notResponding.value) {
      return ClientsClassification.notResponding;
    } else if (value == ClientsClassification.repeated.value) {
      return ClientsClassification.repeated;
    } else if (value == ClientsClassification.differentCountry.value) {
      return ClientsClassification.differentCountry;
    } else if (value == ClientsClassification.other.value) {
      return ClientsClassification.other;
    } else {
      return null;
    }
  }
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
