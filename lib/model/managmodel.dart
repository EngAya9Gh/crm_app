
class ManageModel {
  ManageModel({
    required this.idmange,
    required this.name_mange,
    required this.fk_country,
  });
  late final String idmange;
  late final String name_mange;
  late  String? fk_country;

  ManageModel.fromJson(Map<String, dynamic> json){
    idmange = json['idmange'];
    name_mange = json['name_mange'];
    fk_country = json['fk_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idmange'] = idmange;
    _data['name_mange'] = name_mange;
    _data['fk_country'] = fk_country;
    return _data;
  }
}