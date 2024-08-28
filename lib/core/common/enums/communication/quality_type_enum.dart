enum QualityTypeEnum {
  all,
  waiting,
  quality,
}

extension QualityTypeEnumExtension on QualityTypeEnum {
  String get value {
    switch (this) {
      case QualityTypeEnum.all:
        return 'الكل';
      case QualityTypeEnum.waiting:
        return 'بانتظار الجودة';
      case QualityTypeEnum.quality:
        return 'تم التواصل بالجودة';
    }
  }

  // to param
  String? toParam() {
    switch (this) {
      case QualityTypeEnum.all:
        return null;
      case QualityTypeEnum.waiting:
        return 'wait';
      case QualityTypeEnum.quality:
        return 'done';
    }
  }
}
