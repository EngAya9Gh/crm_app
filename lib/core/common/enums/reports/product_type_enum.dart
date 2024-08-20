enum ProductTypeEnum {
  devices,
  programs;

  static ProductTypeEnum? fromString(String? value) {
    if (value == ProductTypeEnum.devices.name) {
      return ProductTypeEnum.devices;
    } else if (value == ProductTypeEnum.programs.name) {
      return ProductTypeEnum.programs;
    }
    return null;
  }
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
