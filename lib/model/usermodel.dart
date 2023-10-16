import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/home/manage_withdrawals/data/models/user_series.dart';

import '../constants.dart';
import '../ui/screen/home/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';

class UserModel {
  String? idUser;
  String? nameUser;
  String? email;
  String? mobile;
  String? codeVerfiy;
  String? fkCountry;
  String? typeAdministration;
  String? name_mange;
  String? typeLevel;
  String? fkRegoin;
  String? nameCountry;
  String? nameRegoin;
  String? name_level;
  String? periorty;
  String? currency;
  String? isActive;
  String? fkuserAdd;
  String? nameuserAdd;
  String? created_at;
  String? fkuserupdate;
  String? updated_at;
  String? nameuserupdate;
  String? img_image = '';
  String? img_thumbnail = '';
  String? path = '';
  List<UserRegion>? maincitylist_user;

  // List<> maincitylist_user;

  // List<PrivilgeModel>? privilgelist = [];

  UserModel({
    this.idUser,
    this.nameUser,
    this.email,
    this.mobile,
    this.codeVerfiy,
    this.fkCountry,
    this.typeAdministration,
    this.name_mange,
    this.typeLevel,
    this.fkRegoin,
    this.nameCountry,
    this.nameRegoin,
    this.isActive,
    this.fkuserAdd,
    this.created_at,
    this.nameuserAdd,
    this.fkuserupdate,
    this.updated_at,
    this.nameuserupdate,
    this.name_level,
    this.periorty,
    this.currency,
    this.img_image,
    this.img_thumbnail,
    this.path,
    this.maincitylist_user,
    // this.privilgelist,
  });

  //    UserModel.fromJson(jsonData) {
  //     // UserModel user= UserModel(
  //
  //     idUser=jsonData['id_user'];
  //     nameUser= jsonData['nameUser'];
  //
  //     email= jsonData['email'];
  //     mobile= jsonData['mobile'];
  //     codeVerfiy= jsonData!['code_verfiy'];
  //     fkCountry=jsonData['fk_country'];
  //     typeAdministration= jsonData['type_administration'];
  //     name_mange= jsonData['name_mange'];
  //     typeLevel= jsonData['type_level'];
  //     fkRegoin= jsonData['fk_regoin'];
  //     nameCountry= jsonData['nameCountry'];
  //     nameRegoin= jsonData['name_regoin'];
  //     name_level= jsonData['name_level'];
  //     isActive= jsonData['isActive'];
  //     currency= jsonData['currency'];
  //     fkuserAdd= jsonData['fkuserAdd'];
  //     nameuserAdd= jsonData['nameuserAdd'];
  //     created_at= jsonData['created_at'];
  //     img_image= jsonData['img_image'] == null ? '' : urlimage + jsonData['img_image'];
  //     img_thumbnail= jsonData['img_thumbnail'] == null ? '' : urlimage+ jsonData['img_thumbnail'];
  //     path= jsonData['path'];
  //     fkuserupdate= jsonData['fkuserupdate'];
  //     updated_at= jsonData['updated_at'];
  //     nameuserupdate= jsonData['nameuserupdate'];
  //      privilgelist=getproud(jsonData['privilgelist']);
  //
  //   // privilgelist= getproud(jsonData['privilgelist']);
  // // return user;
  // }
  factory UserModel.fromJson(jsonData) {
    return UserModel(
      idUser: jsonData['id_user'],
      nameUser: jsonData['nameUser'],

      email: jsonData['email'],
      mobile: jsonData['mobile'],
      codeVerfiy: jsonData!['code_verfiy'],
      fkCountry: jsonData['fk_country'],
      typeAdministration: jsonData['type_administration'],
      name_mange: jsonData['name_mange'],
      typeLevel: jsonData['type_level'],
      fkRegoin: jsonData['fk_regoin'],
      nameCountry: jsonData['nameCountry'],
      nameRegoin: jsonData['name_regoin'],
      name_level: jsonData['name_level'],
      periorty: jsonData['periorty'],
      isActive: jsonData['isActive'],
      currency: jsonData['currency'],
      fkuserAdd: jsonData['fkuserAdd'],
      nameuserAdd: jsonData['nameuserAdd'],
      created_at: jsonData['created_at'],
      img_image: jsonData['img_image'] == null ? '' : urlimage + jsonData['img_image'],
      img_thumbnail: jsonData['img_thumbnail'] == null ? '' : urlimage + jsonData['img_thumbnail'],
      path: jsonData['path'],
      fkuserupdate: jsonData['fkuserupdate'],
      updated_at: jsonData['updated_at'],
      nameuserupdate: jsonData['nameuserupdate'],
      maincitylist_user: List.of(jsonData['maincitylist_user'] ?? []).map((e) => UserRegion.fromMap(e)).toList(),
      // privilgelist: getproud(jsonData['privilgelist'])
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_user'] = idUser;
    _data['nameUser'] = nameUser;
    _data['fkuserupdate'] = fkuserupdate;
    _data['updated_at'] = updated_at;
    _data['nameuserupdate'] = nameuserupdate;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['code_verfiy'] = codeVerfiy;
    _data['fk_country'] = fkCountry;
    _data['type_administration'] = typeAdministration;
    _data['name_mange'] = name_mange;
    _data['type_level'] = typeLevel;
    _data['fk_regoin'] = fkRegoin;
    _data['nameCountry'] = nameCountry;
    _data['name_regoin'] = nameRegoin;
    _data['name_level'] = name_level;
    _data['isActive'] = isActive;
    _data['currency'] = currency;
    _data['fkuserAdd'] = fkuserAdd;
    _data['created_at'] = created_at;
    _data['nameuserAdd'] = nameuserAdd;
    _data['img_image'] = img_image;
    _data['img_thumbnail'] = img_thumbnail;
    _data['path'] = path;
    return _data;
  }

  UserWithdrawalsManager get asUserWithdrawalsManager => UserWithdrawalsManager(idUser, nameUser);

  List<PrivilgeModel> getproud(data) {
    List<PrivilgeModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        print(i);

        //print("data "+ "[" + data[i] + "]");
        prodlist.add(PrivilgeModel.fromJson(data[i]));
      }
    }
    return prodlist;
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return "${this.nameUser}";
    // return '#${this.idUser} ${this.nameUser}';
  }

  ///this method will prevent the override of toString
  bool getfilteruser(String filter) {
    return this.nameUser?.toLowerCase().toString().contains(filter.toLowerCase()) ?? false;
  }
}

class UserRegion {
  final String? iduser_maincity;
  final String? fk_maincity;
  final String? fk_user;
  final String? namemaincity;
  final String? fk_country;

  UserRegion({
    required this.iduser_maincity,
    required this.fk_maincity,
    required this.fk_user,
    required this.namemaincity,
    required this.fk_country,
  });

  Map<String, dynamic> toMap() {
    return {
      'iduser_maincity': this.iduser_maincity,
      'fk_maincity': this.fk_maincity,
      'fk_user': this.fk_user,
      'namemaincity': this.namemaincity,
      'fk_country': this.fk_country,
    };
  }

  factory UserRegion.fromMap(Map<String, dynamic> map) {
    return UserRegion(
      iduser_maincity: map['iduser_maincity'] as String?,
      fk_maincity: map['fk_maincity'] as String?,
      fk_user: map['fk_user'] as String?,
      namemaincity: map['namemaincity'] as String?,
      fk_country: map['fk_country'] as String?,
    );
  }

  MainCityModel get asMainCity {
    return MainCityModel(
      id_maincity: fk_maincity!,
      namemaincity: namemaincity!,
      fk_country: fk_country!,
    );
  }
}
