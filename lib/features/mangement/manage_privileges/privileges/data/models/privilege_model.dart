import 'package:crm_smart/core/common/helpers/api_helper.dart';

class PrivilegeModel {
  final String? idPrivilegeUser;
  final String? fkLevel;
  final String? fkPrivilege;
  final bool? isCheck;
  final String? namePrivilege;
  final String? typePrv;
  final String? priority;

  const PrivilegeModel({
    this.idPrivilegeUser,
    this.fkLevel,
    this.fkPrivilege,
    this.isCheck,
    this.namePrivilege,
    this.typePrv,
    this.priority,
  });

  factory PrivilegeModel.fromJson(Map<String, dynamic> json) {
    return PrivilegeModel(
      idPrivilegeUser: ApiHelper.handleString(json['id_privg_user']),
      fkLevel: ApiHelper.handleString(json['fk_level']),
      fkPrivilege: ApiHelper.handleString(json['fk_privileg']),
      isCheck: ApiHelper.handleString(json['is_check']) == '1',
      namePrivilege: ApiHelper.handleString(json['name_privilege']),
      typePrv: ApiHelper.handleString(json['type_prv']),
      priority: ApiHelper.handleString(json['periorty']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_privg_user': idPrivilegeUser,
      'fk_level': fkLevel,
      'fk_privileg': fkPrivilege,
      'is_check': isCheck! ? '1' : '0',
      'name_privilege': namePrivilege,
      'type_prv': typePrv,
      'periorty': priority,
    };
  }

  PrivilegeModel copyWith({
    String? idPrivilegeUser,
    String? fkLevel,
    String? fkPrivilege,
    bool? isCheck,
    String? namePrivilege,
    String? typePrv,
    String? priority,
  }) {
    return PrivilegeModel(
      idPrivilegeUser: idPrivilegeUser ?? this.idPrivilegeUser,
      fkLevel: fkLevel ?? this.fkLevel,
      fkPrivilege: fkPrivilege ?? this.fkPrivilege,
      isCheck: isCheck ?? this.isCheck,
      namePrivilege: namePrivilege ?? this.namePrivilege,
      typePrv: typePrv ?? this.typePrv,
      priority: priority ?? this.priority,
    );
  }

  static bool isCheckFromJson(String isCheck) {
    return isCheck == '1';
  }
}
