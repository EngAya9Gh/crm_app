enum OfferItemType {
  percetage('%',"نسبة"),
  value('value',"قيمة"),
  days('days',"ايام");
  final String symbol;
  final String text;
  const OfferItemType(this.symbol,this.text);
}
