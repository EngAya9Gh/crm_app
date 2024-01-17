// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_region_department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegionDepartmentImpl _$$UserRegionDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegionDepartmentImpl(
      idUser: json['id_user'] as int?,
      typeAdministration: json['type_administration'] as String?,
      fkRegoin: json['fk_regoin'] as int?,
      nameUser: json['nameUser'] as String?,
      managements: json['managements'] == null
          ? null
          : Managements.fromJson(json['managements'] as Map<String, dynamic>),
      regions: json['regions'] == null
          ? null
          : Regions.fromJson(json['regions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserRegionDepartmentImplToJson(
        _$UserRegionDepartmentImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'type_administration': instance.typeAdministration,
      'fk_regoin': instance.fkRegoin,
      'nameUser': instance.nameUser,
      'managements': instance.managements,
      'regions': instance.regions,
    };

_$ManagementsImpl _$$ManagementsImplFromJson(Map<String, dynamic> json) =>
    _$ManagementsImpl(
      idmange: json['idmange'] as int?,
      nameMange: json['name_mange'] as String?,
    );

Map<String, dynamic> _$$ManagementsImplToJson(_$ManagementsImpl instance) =>
    <String, dynamic>{
      'idmange': instance.idmange,
      'name_mange': instance.nameMange,
    };

_$RegionsImpl _$$RegionsImplFromJson(Map<String, dynamic> json) =>
    _$RegionsImpl(
      nameRegoin: json['name_regoin'] as String?,
      idRegoin: json['id_regoin'] as int?,
    );

Map<String, dynamic> _$$RegionsImplToJson(_$RegionsImpl instance) =>
    <String, dynamic>{
      'name_regoin': instance.nameRegoin,
      'id_regoin': instance.idRegoin,
    };
