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

  String getUserTitle() {
    switch (this) {
      case TicketTypesEnum.open:
        return 'قام بفتح التذكرة';
      case TicketTypesEnum.receive:
        return 'قام باستلام التذكرة';
      case TicketTypesEnum.close:
        return 'قام بإغلاق التذكرة';
      case TicketTypesEnum.rate:
        return 'قام بالتقييم';
      case TicketTypesEnum.reopen:
        return 'قام بإعادة فتح التذكرة';
      default:
        return '';
    }
  }

  String get nameAr {
    switch (this) {
      case TicketTypesEnum.open:
        return 'جديد';
      case TicketTypesEnum.reopen:
        return 'اعادة فتح';
      case TicketTypesEnum.receive:
        return 'مستلمة';
      case TicketTypesEnum.close:
        return 'غير مقيمة';
      case TicketTypesEnum.rate:
        return 'تم التقييم';
    }
  }
}
