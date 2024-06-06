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
