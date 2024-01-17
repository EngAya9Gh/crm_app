// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privilege_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivilegeModelImpl _$$PrivilegeModelImplFromJson(Map<String, dynamic> json) =>
    _$PrivilegeModelImpl(
      idPrivilegeUser: json['id_privg_user'] as String?,
      fkLevel: json['fk_level'] as String?,
      fkPrivilege: json['fk_privileg'] as String?,
      isCheck: PrivilegeModel.isCheckFromJson(json['is_check'] as String),
      namePrivilege: json['name_privilege'] as String?,
      typePrv: json['type_prv'] as String?,
      priority: json['periorty'] as String?,
    );

Map<String, dynamic> _$$PrivilegeModelImplToJson(
        _$PrivilegeModelImpl instance) =>
    <String, dynamic>{
      'id_privg_user': instance.idPrivilegeUser,
      'fk_level': instance.fkLevel,
      'fk_privileg': instance.fkPrivilege,
      'is_check': instance.isCheck,
      'name_privilege': instance.namePrivilege,
      'type_prv': instance.typePrv,
      'periorty': instance.priority,
    };
