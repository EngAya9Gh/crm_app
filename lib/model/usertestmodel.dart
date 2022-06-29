import '../constants.dart';

class UserTestModel {
  String? id_usertest;
  String? nameusertest;
  String? des_usertest;
  String? fk_country;


  UserTestModel({
    this.id_usertest,
    this.nameusertest,
    this.des_usertest,
    this.fk_country,

  });

  factory UserTestModel.fromJson(jsonData) {
    return UserTestModel(
      id_usertest: jsonData['id_usertest'],
      nameusertest: jsonData['nameusertest'],
      des_usertest: jsonData['des_usertest'],
      fk_country: jsonData['fk_country'],
    );
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_usertest']=id_usertest;
    _data['nameusertest']=nameusertest;
    _data['des_usertest']=des_usertest;
    _data['fk_country']=fk_country;
    return _data;
  }

}

