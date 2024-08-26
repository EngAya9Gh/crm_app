class LevelModel {
  final String? idLevel;
  final String? nameLevel;
  final String? periorty;

  LevelModel({
    this.idLevel,
    this.nameLevel,
    this.periorty,
  });

  // from json
  factory LevelModel.fromMap(dynamic json) {
    return LevelModel(
      idLevel: json['id_level'].toString(),
      nameLevel: json['name_level'],
      periorty: json['periorty'].toString(),
    );
  }

  // copy with
  LevelModel copyWith({
    String? idLevel,
    String? nameLevel,
    String? priority,
  }) {
    return LevelModel(
      idLevel: idLevel ?? this.idLevel,
      nameLevel: nameLevel ?? this.nameLevel,
      periorty: priority ?? this.periorty,
    );
  }
}
