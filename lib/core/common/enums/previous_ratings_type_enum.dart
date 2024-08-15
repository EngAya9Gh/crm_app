enum PreviousRatingsTypeEnum {
  install1,
  install2,
  frequent;

  // from index
  static PreviousRatingsTypeEnum fromIndex(int index) {
    switch (index) {
      case 0:
        return PreviousRatingsTypeEnum.install1;
      case 1:
        return PreviousRatingsTypeEnum.install2;
      case 2:
        return PreviousRatingsTypeEnum.frequent;
      default:
        return PreviousRatingsTypeEnum.install1;
    }
  }
}

extension InstallQualityTypeExtension on PreviousRatingsTypeEnum {
  String get value {
    switch (this) {
      case PreviousRatingsTypeEnum.install1:
        return 'التواصل الأول';
      case PreviousRatingsTypeEnum.install2:
        return 'التواصل الثاني';
      case PreviousRatingsTypeEnum.frequent:
        return 'التواصل الدوري';
    }
  }

  String get toParam {
    switch (this) {
      case PreviousRatingsTypeEnum.install1:
        return "install1";
      case PreviousRatingsTypeEnum.install2:
        return "install2";
      case PreviousRatingsTypeEnum.frequent:
        return "frequent";
    }
  }
}
