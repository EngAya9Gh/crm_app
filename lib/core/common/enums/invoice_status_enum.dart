enum InvoiceStatusEnum { all, pending, installed, suspended }

extension InvoiceStatusEnumExtension on InvoiceStatusEnum {
  String get value {
    switch (this) {
      case InvoiceStatusEnum.all:
        return 'الكل';
      case InvoiceStatusEnum.pending:
        return 'بالإنتظار';
      case InvoiceStatusEnum.installed:
        return 'تم التركيب';
      case InvoiceStatusEnum.suspended:
        return 'معلق';
      default:
        return 'الكل';
    }
  }
}
