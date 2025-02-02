import 'package:crm_smart/core/common/helpers/api_helper.dart';

import '../core/common/models/location/region_model.dart';
import '../core/common/models/user_entity.dart';
import '../core/utils/end_points.dart';
import '../features/mangement/manage_privileges/privileges/data/models/privilege_model.dart';
import '../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';

class UserModel extends UserEntity {
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
  String? priority;
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
  List<PrivilegeModel> privilegesList;
  int? noOfOpenTasks;

  // List<> maincitylist_user;

  // List<PrivilegeModel>? privilgelist = [];

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
    this.priority,
    this.currency,
    this.img_image,
    this.img_thumbnail,
    this.path,
    this.maincitylist_user,
    this.privilegesList = const [],
    this.noOfOpenTasks,
    // this.privilgelist,
  }) : super(
          id: idUser!,
          name: nameUser!,
        );

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      idUser: ApiHelper.handleString(jsonData['id_user']),
      nameUser: ApiHelper.handleString(jsonData['nameUser']),
      email: ApiHelper.handleString(jsonData['email']),
      mobile: ApiHelper.handleString(jsonData['mobile']),
      codeVerfiy: ApiHelper.handleString(jsonData['code_verfiy']),
      fkCountry: ApiHelper.handleString(jsonData['fk_country']),
      typeAdministration:
          ApiHelper.handleString(jsonData['type_administration']),
      name_mange: ApiHelper.handleString(jsonData['name_mange']),
      typeLevel: ApiHelper.handleString(jsonData['type_level']),
      fkRegoin: ApiHelper.handleString(jsonData['fk_regoin']),
      nameCountry: ApiHelper.handleString(jsonData['nameCountry']),
      nameRegoin: ApiHelper.handleString(jsonData['name_regoin']),
      name_level: ApiHelper.handleString(jsonData['name_level']),
      priority: ApiHelper.handleString(jsonData['periorty']),
      isActive: jsonData['isActive'].toString(),
      currency: ApiHelper.handleString(jsonData['currency']),
      fkuserAdd: ApiHelper.handleString(jsonData['fkuserAdd']),
      nameuserAdd: ApiHelper.handleString(jsonData['nameuserAdd']),
      created_at: ApiHelper.handleString(jsonData['created_at']),
      img_image: jsonData['img_image'] == null
          ? ''
          : EndPoints.baseUrls.urlImage + jsonData['img_image'],
      img_thumbnail: jsonData['img_thumbnail'] == null
          ? ''
          : EndPoints.baseUrls.urlImage + jsonData['img_thumbnail'],
      path: ApiHelper.handleString(jsonData['path']),
      noOfOpenTasks: jsonData['no_of_open_tasks'],
      fkuserupdate: ApiHelper.handleString(jsonData['fkuserupdate']),
      updated_at: ApiHelper.handleString(jsonData['updated_at']),
      nameuserupdate: jsonData['nameuserupdate'] != null
          ? ApiHelper.handleString(jsonData['nameuserupdate'])
          : null,
      maincitylist_user: List.of(jsonData['maincitylist_user'] ?? [])
          .map((e) => UserRegion.fromMap(e))
          .toList(),
      privilegesList: List.of(jsonData['privilgelist'] ?? [])
          .map((e) => PrivilegeModel.fromJson(e))
          .toList(),
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
    _data['no_of_open_tasks'] = noOfOpenTasks;
    _data['maincitylist_user'] =
        maincitylist_user?.map((e) => e.toMap()).toList();
    _data['privilgelist'] = privilegesList.map((e) => e.toJson()).toList();

    return _data;
  }

  UserWithdrawalsManager get asUserWithdrawalsManager =>
      UserWithdrawalsManager(idUser, nameUser);

  List<PrivilegeModel> getproud(data) {
    List<PrivilegeModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(PrivilegeModel.fromJson(data[i]));
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
    return this
            .nameUser
            ?.toLowerCase()
            .toString()
            .contains(filter.toLowerCase()) ??
        false;
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

  RegionModel get asRegion {
    return RegionModel(
      id_maincity: fk_maincity!,
      namemaincity: namemaincity!,
      fk_country: fk_country!,
    );
  }
}
