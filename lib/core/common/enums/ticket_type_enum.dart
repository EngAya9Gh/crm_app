enum TicketType { newTicket, reOpen, inProgress, closed, rated }

extension TicketTypeExtension on TicketType {
  String get name {
    switch (this) {
      case TicketType.newTicket:
        return 'جديدة';
      case TicketType.reOpen:
        return 'اعادة فتح';
      case TicketType.inProgress:
        return 'قيد التنفيذ';
      case TicketType.closed:
        return 'مغلقة';
      case TicketType.rated:
        return 'تم التقييم';
    }
  }
}

extension TicketTypeValueExtension on TicketType {
  String get value {
    switch (this) {
      case TicketType.newTicket:
        return '0';
      case TicketType.reOpen:
        return '1';
      case TicketType.inProgress:
        return '2';
      case TicketType.closed:
        return '3';
      case TicketType.rated:
        return '4';
    }
  }

  static TicketType fromValue(String value) {
    switch (value) {
      case '0':
        return TicketType.newTicket;
      case '1':
        return TicketType.reOpen;
      case '2':
        return TicketType.inProgress;
      case '3':
        return TicketType.closed;
      case '4':
        return TicketType.rated;
      default:
        return TicketType.newTicket;
    }
  }
}
