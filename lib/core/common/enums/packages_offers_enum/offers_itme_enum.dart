enum OfferItemType {
  percetage('%'),
  value('value'),
  days('days');
  final String symbol;
  const OfferItemType(this.symbol);
}
