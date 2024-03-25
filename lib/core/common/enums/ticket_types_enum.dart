enum TicketTypesEnum {
  reopen,
  close,
  receive,
  rate,
}

extension TicketTypeExtension on TicketTypesEnum {
  String get name {
    switch (this) {
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
      case TicketTypesEnum.reopen:
        return 'فتح';
      case TicketTypesEnum.close:
        return 'اغلاق';
      case TicketTypesEnum.receive:
        return 'استلام';
      case TicketTypesEnum.rate:
        return 'تقييم';
    }
  }
}
