enum TicketDestinationEnum {
  care('تذكرة عناية'),
  support('تذكرة دعم');

  final String value;
  const TicketDestinationEnum(this.value);
  String get toParam {
    switch (this) {
      case TicketDestinationEnum.care:
        return '4';
      case TicketDestinationEnum.support:
        return '3';

    }
  }

}
