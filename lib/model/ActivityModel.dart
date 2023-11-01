class ActivityModel {
  ActivityModel({
    required this.id_activity_type,
    required this.name_activity_type,
    // required this.type,
  });

  late  String id_activity_type;
  late  String name_activity_type;
  // late final String type;

  ActivityModel.fromJson(Map<String, dynamic> json){
    id_activity_type = json['id_activity_type'];
    name_activity_type = json['name_activity_type'];
    // type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_activity_type'] = id_activity_type;
    _data['name_activity_type'] = name_activity_type;
    // _data['type'] = type;
    return _data;
  }
  String userAsString() {
    return "${this.name_activity_type}";
    // return '#${this.idUser} ${this.nameUser}';
  }
  bool getFilterActivityType(String filter) {
    return this.name_activity_type.toLowerCase().toString().contains(filter.toLowerCase()) ?? false;
  }
}