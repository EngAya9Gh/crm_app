

class TargetModel{
  TargetModel({
     this.target,
    required this.fk_idUser,
    required this.nameUser,
    required this.name_regoin,
    required this.img_image,
    required this.name_level,
    this.Q1,
    this.Q2,
    this.Q3,
    this.Q4,
  });
  late  String? target;
  late final String fk_idUser;
  late final String nameUser;
  late final String name_regoin;
  late  String img_image;
  late  String? name_level;
  late  String? Q1;
  late  String? Q2;
  late  String? Q3;
  late  String? Q4;


  TargetModel.fromJson(Map<String, dynamic> json){
    target = json['target'];
    fk_idUser = json['fk_idUser'];
    nameUser = json['nameUser'];
    name_regoin = json['name_regoin'];
    img_image = json['img_image'];
    name_level = json['name_level'];
    Q1 = json['Q1'];
    Q2 = json['Q2'];
    Q3 = json['Q3'];
    Q4 = json['Q4'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['target'] = target;
    _data['fk_idUser'] = fk_idUser;
    _data['nameUser'] = nameUser;
    _data['name_regoin'] = name_regoin;
    _data['img_image'] = img_image;
    _data['name_level'] = name_level;
    _data['Q1'] = Q1;
    _data['Q2'] = Q2;
    _data['Q3'] = Q3;
    _data['Q4'] = Q4;

    return _data;
  }


}