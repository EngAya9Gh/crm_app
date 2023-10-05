import 'package:crm_smart/model/usermodel.dart';

class MainCityModel {
  late final String id_maincity, fk_country; //nameCountry,currency;
  late final String namemaincity;

  MainCityModel({
    required this.id_maincity,
    required this.namemaincity,
    required this.fk_country,
    // this.nameCountry,this.currency
  });

  factory MainCityModel.fromJson(Map<String, dynamic> json) {
    return MainCityModel(
      id_maincity: json["id_maincity"],
      namemaincity: json["namemaincity"],
      fk_country: json["fk_country"],
      // nameCountry:json["nameCountry"],
      // currency:json["currency"]
    );
  }

  bool getfilteruser(String filter) {
    return this.namemaincity.toString().contains(filter);
  }

  String userAsString() {
    return "${this.namemaincity}";
    // return '#${this.idUser} ${this.nameUser}';
  }

  UserRegion asUserRegion() {
    return UserRegion(
      iduser_maincity: null,
      fk_maincity: id_maincity,
      fk_user: null,
      namemaincity: namemaincity,
      fk_country: fk_country,
    );
  }


  @override
  String toString() {
    return 'MainCityModel{id_maincity: $id_maincity, fk_country: $fk_country, namemaincity: $namemaincity}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id_maincity': this.id_maincity,
      'fk_country': this.fk_country,
      'namemaincity': this.namemaincity,
    };
  }
}

class CityModel {
  late final String id_city, fk_maincity; //nameCountry,currency;
  late final String name_city;

  CityModel({
    required this.id_city,
    required this.name_city,
    required this.fk_maincity,
    // this.nameCountry,this.currency
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id_city: json["id_city"],
      name_city: json["name_city"],
      fk_maincity: json["fk_maincity"],
    );
  }

  String userAsString() {
    return "${this.name_city}";
    // return '#${this.idUser} ${this.nameUser}';
  }

  ///this method will prevent the override of toString
  bool getfilteruser(String filter) {
    return this.name_city.toString().contains(filter);
  }
}
