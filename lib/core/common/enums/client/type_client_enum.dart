enum TypeClientEnum {
  all,
  subscriber,
  negotiation,
  offer,
  excluded,
  withdrawn,
  suspendedExclusion,
}

extension TypeOfClientFilterExtension on TypeClientEnum {
  String get value {
    switch (this) {
      case TypeClientEnum.all:
        return 'الكل';
      case TypeClientEnum.subscriber:
        return 'مشترك';
      case TypeClientEnum.negotiation:
        return 'تفاوض';
      case TypeClientEnum.offer:
        return 'عرض سعر';
      case TypeClientEnum.excluded:
        return 'مستبعد';
      case TypeClientEnum.withdrawn:
        return 'منسحب';
      case TypeClientEnum.suspendedExclusion:
        return 'معلق استبعاد';
    }
  }
}
