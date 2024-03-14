enum CommmentType {
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

extension CommmentTypeExt on CommmentType {
  String get value {
    switch (this) {
      case CommmentType.all:
        return 'الكل';
      case CommmentType.supportService:
        return 'خدمة دعم';
      case CommmentType.clientVisit:
        return 'زيارة عميل';
      case CommmentType.clientRequirements:
        return 'متطلبات العميل';
      case CommmentType.evaluateResult:
        return 'نتيجة تقييم';
      case CommmentType.generalNote:
        return 'ملاحظة عامة';
      case CommmentType.reschedule:
        return 'إعادة جدولة';
      case CommmentType.excludeClient:
        return 'استبعاد عميل';
      case CommmentType.notReady:
        return 'غير جاهز';
      case CommmentType.suspend:
        return 'تعليق التركيب';
    }
  }
}
