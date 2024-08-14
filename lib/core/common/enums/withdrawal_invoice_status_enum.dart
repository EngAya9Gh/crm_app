enum WithdrawalInvoiceStatusEnum {
  all,
  pending,
  withdrawn,
  rejected,
  user,
  canceled,
}

extension InvoiceStatusEnumExtension on WithdrawalInvoiceStatusEnum {
  String get value {
    switch (this) {
      case WithdrawalInvoiceStatusEnum.all:
        return 'الكل';
      case WithdrawalInvoiceStatusEnum.pending:
        return 'بالإنتظار';
      case WithdrawalInvoiceStatusEnum.withdrawn:
        return 'منسحبة';
      case WithdrawalInvoiceStatusEnum.rejected:
        return 'مرفوضة';
      case WithdrawalInvoiceStatusEnum.canceled:
        return 'ملغية';
      case WithdrawalInvoiceStatusEnum.user:
      default:
        return 'يحتاج معالجة';
    }
  }
}

extension InvoiceStatusEnumExtensionValue on WithdrawalInvoiceStatusEnum {
  String get toParam {
    switch (this) {
      case WithdrawalInvoiceStatusEnum.pending:
        return '0';
      case WithdrawalInvoiceStatusEnum.withdrawn:
        return '1';
      case WithdrawalInvoiceStatusEnum.rejected:
        return '2';
      case WithdrawalInvoiceStatusEnum.all:
        return "all";
      case WithdrawalInvoiceStatusEnum.canceled:
        return 'canceled';
      case WithdrawalInvoiceStatusEnum.user:
      default:
        return 'user';
    }
  }
}
