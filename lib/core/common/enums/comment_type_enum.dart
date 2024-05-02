enum CommentTypeEnum {
  all,
  supportService,
  clientVisit,
  clientRequirements,
  evaluateResult,
  generalNote,
  reschedule,
  excludeClient,
  notReady,
  suspend,
}

extension CommmentTypeExt on CommentTypeEnum {
  String get value {
    switch (this) {
      case CommentTypeEnum.all:
        return 'الكل';
      case CommentTypeEnum.supportService:
        return 'خدمة دعم';
      case CommentTypeEnum.clientVisit:
        return 'زيارة عميل';
      case CommentTypeEnum.clientRequirements:
        return 'متطلبات العميل';
      case CommentTypeEnum.evaluateResult:
        return 'نتيجة تقييم';
      case CommentTypeEnum.generalNote:
        return 'ملاحظة عامة';
      case CommentTypeEnum.reschedule:
        return 'إعادة جدولة';
      case CommentTypeEnum.excludeClient:
        return 'استبعاد عميل';
      case CommentTypeEnum.notReady:
        return 'غير جاهز';
      case CommentTypeEnum.suspend:
        return 'تعليق التركيب';
    }
  }
}
