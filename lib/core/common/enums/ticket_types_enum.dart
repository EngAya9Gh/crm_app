enum TicketTypesEnum {
  open,
  reopen,
  close,
  receive,
  rate,
}

extension TicketTypeExtension on TicketTypesEnum {
  String get nameEn {
    switch (this) {
      case TicketTypesEnum.open:
        return 'open';
      case TicketTypesEnum.reopen:
        return 'reopen';
      case TicketTypesEnum.close:
        return 'close';
      case TicketTypesEnum.receive:
        return 'recive';
      case TicketTypesEnum.rate:
        return 'rate';
    }
  }

  String get nameAr {
    switch (this) {
      case TicketTypesEnum.open:
        return 'جديدة';
      case TicketTypesEnum.reopen:
        return 'معاد فتحها';
      case TicketTypesEnum.close:
        return 'مغلقة';
      case TicketTypesEnum.receive:
        return 'قيد التنفيذ';
      case TicketTypesEnum.rate:
        return 'تم التقييم';
    }
  }
}
