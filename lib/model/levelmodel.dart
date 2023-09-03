class LevelModel {
  LevelModel({
    required this.idLevel,
    required this.nameLevel,
    required this.periorty,
  });
  late   String idLevel;
  late   String nameLevel;
  late   String periorty;

  LevelModel.fromJson(Map<String, dynamic> json){
    idLevel = json['id_level'];
    nameLevel = json['name_level'];
    periorty = json['periorty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_level'] = idLevel;
    _data['name_level'] = nameLevel;
    _data['periorty'] = periorty;
    return _data;
  }
}