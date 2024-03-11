enum InvoiceStatusEnum { pending, withdrawn, rejected, all, user }

extension InvoiceStatusEnumExtension on InvoiceStatusEnum {
  String get text {
    switch (this) {
      case InvoiceStatusEnum.all:
        return 'الكل';
      case InvoiceStatusEnum.pending:
        return 'بالإنتظار';
      case InvoiceStatusEnum.withdrawn:
        return 'منسحبة';
      case InvoiceStatusEnum.rejected:
        return 'مرفوضة';
      case InvoiceStatusEnum.user:
      default:
        return 'user';
    }
  }
}

extension InvoiceStatusEnumExtensionValue on InvoiceStatusEnum {
  String get value {
    switch (this) {
      case InvoiceStatusEnum.pending:
        return '0';
      case InvoiceStatusEnum.withdrawn:
        return '1';
      case InvoiceStatusEnum.rejected:
        return '2';
      case InvoiceStatusEnum.all:
        return "all";
      case InvoiceStatusEnum.user:
      default:
        return 'user';
    }
  }
}
