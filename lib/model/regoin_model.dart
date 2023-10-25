class RegionModel {
  late String regionId, countryId; //nameCountry,currency;
  late String regionName;

  RegionModel({
    required this.regionId,
    required this.regionName,
    required this.countryId,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      regionId: json["id_regoin"],
      regionName: json["name_regoin"],
      countryId: json["fk_country"],
    );
  }
}
