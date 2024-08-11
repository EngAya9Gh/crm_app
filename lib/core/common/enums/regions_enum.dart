enum RegionsEnum {
  agentsBranch,
}

extension RegionsEnumExtension on RegionsEnum {
  String get fkRegion {
    switch (this) {
      case RegionsEnum.agentsBranch:
        return '11';
    }
  }
}
