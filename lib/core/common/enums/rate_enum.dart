enum RateEnum { excellent, good, acceptable, bad }

extension RateExtension on RateEnum {
  String get value {
    switch (this) {
      case RateEnum.excellent:
        return 'ممتاز';
      case RateEnum.good:
        return 'جيد';
      case RateEnum.acceptable:
        return 'مقبول';
      case RateEnum.bad:
        return 'سيء';
    }
  }
}
