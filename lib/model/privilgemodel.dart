class PrivilgeModel {
  PrivilgeModel({
    required this.idPrivgUser,
    required this.fkLevel,
    required this.fkPrivileg,
    required this.isCheck,
    required this.name_privilege,
    required this.type_prv,
  });
  late final String idPrivgUser;
  late final String fkLevel;
  late final String fkPrivileg;
  late  String isCheck;
  late final String name_privilege;
  late final String type_prv;
  late  String periorty='0';

  PrivilgeModel.fromJson(Map<String, dynamic> json){
    idPrivgUser = json['id_privg_user'];
    fkLevel = json['fk_level'];
    fkPrivileg = json['fk_privileg'];
    isCheck = json['is_check'];
    name_privilege = json['name_privilege'];
    type_prv = json['type_prv'];
    periorty = json['periorty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_privg_user'] = idPrivgUser;
    _data['fk_level'] = fkLevel;
    _data['fk_privileg'] = fkPrivileg;
    _data['is_check'] = isCheck;
    _data['name_privilege'] = name_privilege;
    _data['type_prv'] = type_prv;
    _data['periorty'] = periorty;
    return _data;
  }
}