enum TicketTypesEnum {
  open,
  reopen,
  receive,
  close,
  rate,
}

extension TicketTypeExtension on TicketTypesEnum {
  String get nameEn {
    switch (this) {
      case TicketTypesEnum.open:
        return 'open';
      case TicketTypesEnum.reopen:
        return 'reopen';
      case TicketTypesEnum.receive:
        return 'recive';
      case TicketTypesEnum.close:
        return 'close';
      case TicketTypesEnum.rate:
        return 'rate';
    }
  }

  // get current ticket type from the en name
  static TicketTypesEnum getTicketType(String? name) {
    switch (name) {
      case 'open':
        return TicketTypesEnum.open;
      case 'reopen':
        return TicketTypesEnum.reopen;
      case 'recive':
        return TicketTypesEnum.receive;
      case 'close':
        return TicketTypesEnum.close;
      case 'rate':
        return TicketTypesEnum.rate;
      default:
        return TicketTypesEnum.open;
    }
  }

  String get nameAr {
    switch (this) {
      case TicketTypesEnum.open:
        return 'جديدة';
      case TicketTypesEnum.reopen:
        return 'معاد فتحها';
      case TicketTypesEnum.receive:
        return 'قيد التنفيذ';
      case TicketTypesEnum.close:
        return 'مغلقة';
      case TicketTypesEnum.rate:
        return 'تم التقييم';
    }
  }
}
