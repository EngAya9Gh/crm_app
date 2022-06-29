

class ConfigModel {
  ConfigModel({
    required this.id_config,
    required this.name_config,
    required this.value_config,
    required this.fk_country
  });
  late final String id_config;
  late  String name_config;
  late final String value_config;
  late final String fk_country;

  ConfigModel.fromJson(Map<String, dynamic> json){
    id_config = json['id_config'];
    name_config = json['name_config'];
    value_config = json['value_config'];
    fk_country = json['fk_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_config'] = id_config;
    _data['name_config'] = name_config;
    _data['value_config'] = value_config;
    _data['fk_country'] = fk_country;
    return _data;
  }
}