class ReasonModel {
  ReasonModel({
    required this.idReason,
    required this.nameReason,
    required this.type,
  });

  late final String idReason;
  late final String nameReason;
  late final String type;

  ReasonModel.fromJson(Map<String, dynamic> json){
    idReason = json['id_reason'];
    nameReason = json['name_reason'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_reason'] = idReason;
    _data['name_reason'] = nameReason;
    _data['type'] = type;
    return _data;
  }
}