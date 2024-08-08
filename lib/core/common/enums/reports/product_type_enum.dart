enum ProductTypeEnum {
  devices,
  programs,
}

extension ProductTypeEnumExtension on ProductTypeEnum {
  String get value {
    switch (this) {
      case ProductTypeEnum.devices:
        return 'أجهزة';
      case ProductTypeEnum.programs:
        return 'برامج';
    }
  }
}
