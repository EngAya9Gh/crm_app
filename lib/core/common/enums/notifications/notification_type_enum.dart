enum NotificationTypeEnum {
  commentMention,
  reInstall,
  activity,
  addTicket,
  scheduleClient,
  closeTicket,
  closeSchedule,
  installCanceled,
  receiveClient,
  agentVisit,
  clientVisit,
  InvoiceDeleted,
  AddPayment,
  NotReady,
  EditInvoice,
  participateAdd,
  TransferRefuse,
  TransferAccept,
  DeviceAdd,
  InvoiceUpdated,
  Transfer,
  saleExceeded,
  checkClient,
  AddComment,
  Exclude,
  ApproveDone,
  ApproveInvoiceBack,
  ApproveRequest,
  Install,
  Task,

  // ApproveFRequest,
  // CheckComment,
  // ApproveRefuse,
  // MarketingClient,
  // OpenTicket,
  // InvoiceBack,
  // InvoiceReplay,
  // TransferTicket,
  // DeviceReady,
}

extension NotificationTypeEnumExtension on NotificationTypeEnum {
  String get name {
    switch (this) {
      case NotificationTypeEnum.ApproveRequest:
        return 'ApproveRequest';
      // case NotificationTypeEnum.ApproveFRequest:
        // return 'ApproveFRequest';
      // case NotificationTypeEnum.CheckComment:
        // return 'checkComment';
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
      // case NotificationTypeEnum.ApproveRefuse:
        // return 'ApproveRefuse';
      case NotificationTypeEnum.InvoiceDeleted:
        return 'InvoiceDeleted';
      case NotificationTypeEnum.Install:
        return 'Install';
      case NotificationTypeEnum.AddComment:
        return 'AddComment';
      // case NotificationTypeEnum.MarketingClient:
        // return 'Marketing Client';
      // case NotificationTypeEnum.OpenTicket:
        // return 'OpenTicket';
      case NotificationTypeEnum.InvoiceUpdated:
        return 'InvoiceUpdated';
      // case NotificationTypeEnum.InvoiceBack:
        // return 'InvoiceBack';
      // case NotificationTypeEnum.InvoiceReplay:
        // return 'InvoiceReplay';
      // case NotificationTypeEnum.TransferTicket:
        // return 'TransferTicket';
      case NotificationTypeEnum.Exclude:
        return 'exclude';
      case NotificationTypeEnum.DeviceAdd:
        return 'deviceAdd';
      // case NotificationTypeEnum.DeviceReady:
        // return 'deviceReady';
      case NotificationTypeEnum.commentMention:
        return 'commentMention';
      case NotificationTypeEnum.reInstall:
        return 'reInstall';
      case NotificationTypeEnum.activity:
        return 'activity';
      case NotificationTypeEnum.addTicket:
        return 'addTicket';
      case NotificationTypeEnum.scheduleClient:
        return 'scheduleClient';
      case NotificationTypeEnum.closeTicket:
        return 'closeTicket';
      case NotificationTypeEnum.installCanceled:
        return 'installCanceled';
      case NotificationTypeEnum.receiveClient:
        return 'receiveClient';
      case NotificationTypeEnum.agentVisit:
        return 'agentVisit';
      case NotificationTypeEnum.clientVisit:
        return 'clientVisit';
      case NotificationTypeEnum.participateAdd:
        return 'participateAdd';
      case NotificationTypeEnum.saleExceeded:
        return 'saleExceeded';
      case NotificationTypeEnum.checkClient:
        return 'checkClient';
      case NotificationTypeEnum.ApproveInvoiceBack:
        return 'ApproveInvoiceBack';
      case NotificationTypeEnum.closeSchedule:
        return 'ApproveInvoiceBack';
    }
  }

  String get value {
    switch (this) {
      case NotificationTypeEnum.ApproveRequest:
        return 'طلب موافقة';
      // case NotificationTypeEnum.ApproveFRequest:
        // return 'طلب موافقة';
      // case NotificationTypeEnum.CheckComment:
        // return 'تعليق';
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
      // case NotificationTypeEnum.ApproveRefuse:
        // return 'تم الرفض';
      case NotificationTypeEnum.InvoiceDeleted:
        return 'تم حذف الفاتورة';
      case NotificationTypeEnum.Install:
        return 'تثبيت';
      case NotificationTypeEnum.AddComment:
        return 'إضافة تعليق';
      // case NotificationTypeEnum.MarketingClient:
        // return 'تسويق العميل';
      // case NotificationTypeEnum.OpenTicket:
        // return 'فتح تذكرة';
      case NotificationTypeEnum.InvoiceUpdated:
        return 'تحديث فاتورة';
      // case NotificationTypeEnum.InvoiceBack:
        // return 'عودة فاتورة';
      // case NotificationTypeEnum.InvoiceReplay:
        // return 'رد على فاتورة';
      // case NotificationTypeEnum.TransferTicket:
        // return 'تحويل تذكرة';
      case NotificationTypeEnum.Exclude:
        return 'استبعاد';
      case NotificationTypeEnum.DeviceAdd:
        return 'إضافة جهاز';
      // case NotificationTypeEnum.DeviceReady:
        // return 'جاهز';
        case NotificationTypeEnum.commentMention:
        return 'ذكر في تعليق';
      case NotificationTypeEnum.reInstall:
        return 'اعادة الثبيت';
      case NotificationTypeEnum.activity:
        return 'نشاط';
      case NotificationTypeEnum.addTicket:
        return 'اضافة تذكرة';
      case NotificationTypeEnum.scheduleClient:
        return 'جدولة عميل';
      case NotificationTypeEnum.closeTicket:
        return 'اغلاق تذكرة';
      case NotificationTypeEnum.installCanceled:
        return 'الغاء التثبيت';
      case NotificationTypeEnum.receiveClient:
        return 'استلام عميل';
      case NotificationTypeEnum.agentVisit:
        return 'وزيارة عميل';
      case NotificationTypeEnum.clientVisit:
        return 'clientVisit';
      case NotificationTypeEnum.participateAdd:
        return 'participateAdd';
      case NotificationTypeEnum.saleExceeded:
        return 'saleExceeded';
      case NotificationTypeEnum.checkClient:
        return 'checkClient';
      case NotificationTypeEnum.ApproveInvoiceBack:
        return 'ApproveInvoiceBack';
      case NotificationTypeEnum.closeSchedule:
        return 'ApproveInvoiceBack';
    }
  }
}
