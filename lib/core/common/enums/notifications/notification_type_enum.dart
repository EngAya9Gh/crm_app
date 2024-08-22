enum NotificationTypeEnum {
  ApproveRequest,
  Transfer,
  Late,
  ApproveDone,
  ApproveRefuse,
  InvoiceDeleted,
  Install
}

extension NotificationTypeEnumExtension on NotificationTypeEnum {
  String get value {
    switch (this) {
      case NotificationTypeEnum.ApproveRequest:
        return 'طلب موافقة';
      case NotificationTypeEnum.Transfer:
        return 'تحويل';
      case NotificationTypeEnum.Late:
        return 'متأخر';
      case NotificationTypeEnum.ApproveDone:
        return 'تم الموافقة';
      case NotificationTypeEnum.ApproveRefuse:
        return 'تم الرفض';
      case NotificationTypeEnum.InvoiceDeleted:
        return 'تم حذف الفاتورة';
      case NotificationTypeEnum.Install:
        return 'تثبيت';
    }
  }
}
