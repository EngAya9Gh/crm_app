enum InvoiceTypeEnum {
  withdrawnInvoices;

  static InvoiceTypeEnum? fromString(String? value) {
    if (value == InvoiceTypeEnum.withdrawnInvoices.name) {
      return InvoiceTypeEnum.withdrawnInvoices;
    }
    return null;
  }
}

extension InvoiceTypeEnumExtension on InvoiceTypeEnum {
  String get value {
    switch (this) {
      case InvoiceTypeEnum.withdrawnInvoices:
        return 'الفواتير المنسحبة';
    }
  }
}
