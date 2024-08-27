import '../../../../model/usermodel.dart';

class RegionModel {
  late final String id_maincity;
  final String fk_country;
  late final String namemaincity;

  RegionModel({
    required this.id_maincity,
    required this.namemaincity,
    required this.fk_country,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id_maincity: json["id_maincity"].toString(),
      namemaincity: json["namemaincity"],
      fk_country: json["fk_country"].toString(),
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

  Map<String, dynamic> toMap() {
    return {
      'id_maincity': this.id_maincity,
      'fk_country': this.fk_country,
      'namemaincity': this.namemaincity,
    };
  }
}
