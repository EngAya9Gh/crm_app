enum CommmentType {supportService, clientVisit, clientRequirements ,evaluateResult,generalNote}

extension CommmentTypeExt on CommmentType {
  String get value {
    switch (this) {
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
    }
  }
}