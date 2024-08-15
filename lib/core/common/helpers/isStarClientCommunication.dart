import '../enums/regions_enum.dart';

bool isStarClientCommunication({
  String? typeSeller,
  String? fkRegion,
}) {
  return typeSeller != '1' && fkRegion == RegionsEnum.agentsBranch.fkRegion;
}
