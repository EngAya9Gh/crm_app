class CityModel {
  final String cityId;
  final String regionId;
  final String cityName;

  const CityModel({
    required this.cityId,
    required this.cityName,
    required this.regionId,
  });

  factory CityModel.fromJson(dynamic json) {
    return CityModel(
      cityId: json["id_city"].toString(),
      cityName: json["name_city"],
      regionId: json["fk_maincity"].toString(),
    );
  }

  bool searchString(String filter) {
    return this.cityName.toLowerCase().contains(filter.toLowerCase());
  }
}
