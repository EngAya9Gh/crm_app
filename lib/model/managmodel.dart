class ManageModel {
  ManageModel({
    required this.idMange,
    required this.name_mange,
    required this.fk_country,
  });

  final String idMange;
  final String name_mange;
  final String? fk_country;

  factory ManageModel.fromMap(Map<String, dynamic> json) {
    return ManageModel(
      idMange: json['idmange'].toString(),
      name_mange: json['name_mange'],
      fk_country:
          json['fk_country'] == null ? null : json['fk_country'].toString(),
    );
  }

  @override
  String toString() {
    return 'ManageModel{idmange: $idMange, name_mange: $name_mange, fk_country: $fk_country}';
  }
}
