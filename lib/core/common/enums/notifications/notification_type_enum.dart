enum NotificationTypeEnum {
  ApproveRequest,
  ApproveFRequest,
  CheckComment,
  Task,
  Transfer,
  TransferRefuse,
  TransferAccept,
  AddPayment,
  EditInvoice,
  NotReady,
  ApproveDone,
  ApproveRefuse,
  InvoiceDeleted,
  Install,
  AddComment,
  MarketingClient,
  OpenTicket,
  InvoiceUpdated,
  InvoiceBack,
  InvoiceReplay,
  TransferTicket,
  Exclude,
  DeviceAdd,
  DeviceReady,
}

extension NotificationTypeEnumExtension on NotificationTypeEnum {
  String get name {
    switch (this) {
      case NotificationTypeEnum.ApproveRequest:
        return 'ApproveRequest';
      case NotificationTypeEnum.ApproveFRequest:
        return 'ApproveFRequest';
      case NotificationTypeEnum.CheckComment:
        return 'checkComment';
      case NotificationTypeEnum.Task:
        return 'task';
      case NotificationTypeEnum.Transfer:
        return 'Transfer';
      case NotificationTypeEnum.TransferRefuse:
        return 'TransferRefuse';
      case NotificationTypeEnum.TransferAccept:
        return 'TransferAccept';
      case NotificationTypeEnum.AddPayment:
        return 'AddPayment';
      case NotificationTypeEnum.EditInvoice:
        return 'EditInvoice';
      case NotificationTypeEnum.NotReady:
        return 'NotReady';
      case NotificationTypeEnum.ApproveDone:
        return 'ApproveDone';
      case NotificationTypeEnum.ApproveRefuse:
        return 'ApproveRefuse';
      case NotificationTypeEnum.InvoiceDeleted:
        return 'InvoiceDeleted';
      case NotificationTypeEnum.Install:
        return 'Install';
      case NotificationTypeEnum.AddComment:
        return 'AddComment';
      case NotificationTypeEnum.MarketingClient:
        return 'Marketing Client';
      case NotificationTypeEnum.OpenTicket:
        return 'OpenTicket';
      case NotificationTypeEnum.InvoiceUpdated:
        return 'InvoiceUpdated';
      case NotificationTypeEnum.InvoiceBack:
        return 'InvoiceBack';
      case NotificationTypeEnum.InvoiceReplay:
        return 'InvoiceReplay';
      case NotificationTypeEnum.TransferTicket:
        return 'TransferTicket';
      case NotificationTypeEnum.Exclude:
        return 'exclude';
      case NotificationTypeEnum.DeviceAdd:
        return 'deviceAdd';
      case NotificationTypeEnum.DeviceReady:
        return 'deviceReady';
    }
  }

  String get value {
    switch (this) {
      case NotificationTypeEnum.ApproveRequest:
        return 'طلب موافقة';
      case NotificationTypeEnum.ApproveFRequest:
        return 'طلب موافقة';
      case NotificationTypeEnum.CheckComment:
        return 'تعليق';
      case NotificationTypeEnum.Task:
        return 'مهمة';
      case NotificationTypeEnum.Transfer:
        return 'تحويل';
      case NotificationTypeEnum.TransferRefuse:
        return 'رفض تحويل';
      case NotificationTypeEnum.TransferAccept:
        return 'قبول تحويل';
      case NotificationTypeEnum.AddPayment:
        return 'إضافة دفعة';
      case NotificationTypeEnum.EditInvoice:
        return 'تعديل فاتورة';
      case NotificationTypeEnum.NotReady:
        return 'غير جاهز';
      case NotificationTypeEnum.ApproveDone:
        return 'تم الموافقة';
      case NotificationTypeEnum.ApproveRefuse:
        return 'تم الرفض';
      case NotificationTypeEnum.InvoiceDeleted:
        return 'تم حذف الفاتورة';
      case NotificationTypeEnum.Install:
        return 'تثبيت';
      case NotificationTypeEnum.AddComment:
        return 'إضافة تعليق';
      case NotificationTypeEnum.MarketingClient:
        return 'تسويق العميل';
      case NotificationTypeEnum.OpenTicket:
        return 'فتح تذكرة';
      case NotificationTypeEnum.InvoiceUpdated:
        return 'تحديث فاتورة';
      case NotificationTypeEnum.InvoiceBack:
        return 'عودة فاتورة';
      case NotificationTypeEnum.InvoiceReplay:
        return 'رد على فاتورة';
      case NotificationTypeEnum.TransferTicket:
        return 'تحويل تذكرة';
      case NotificationTypeEnum.Exclude:
        return 'استبعاد';
      case NotificationTypeEnum.DeviceAdd:
        return 'إضافة جهاز';
      case NotificationTypeEnum.DeviceReady:
        return 'جاهز';
    }
  }
}
