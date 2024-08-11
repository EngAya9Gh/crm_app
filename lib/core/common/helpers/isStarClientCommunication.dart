bool isStarClientCommunication({
  String? typeSeller,
  String? fkRegion,
}) {
  return typeSeller != '1' && fkRegion == 11;
}
