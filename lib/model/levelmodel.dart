class LevelModel {
  LevelModel({
    required this.idLevel,
    required this.nameLevel,
  });
  late final String idLevel;
  late final String nameLevel;

  LevelModel.fromJson(Map<String, dynamic> json){
    idLevel = json['id_level'];
    nameLevel = json['name_level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_level'] = idLevel;
    _data['name_level'] = nameLevel;
    return _data;
  }
}