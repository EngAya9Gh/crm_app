// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distinctive_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistinctiveClientImpl _$$DistinctiveClientImplFromJson(
        Map<String, dynamic> json) =>
    _$DistinctiveClientImpl(
      dateCreate: json['date_create'] == null
          ? null
          : DateTime.parse(json['date_create'] as String),
      fkClient: json['fk_client'] as String?,
      nameEnterprise: json['name_enterprise'] as String?,
      nameUser: json['nameUser'] as String?,
      mobile: json['mobile'] as String?,
      fkRegoin: json['fk_regoin'] as String?,
      nameRegoin: json['name_regoin'] as String?,
      nameClient: json['name_client'] as String?,
    );

Map<String, dynamic> _$$DistinctiveClientImplToJson(
        _$DistinctiveClientImpl instance) =>
    <String, dynamic>{
      'date_create': instance.dateCreate?.toIso8601String(),
      'fk_client': instance.fkClient,
      'name_enterprise': instance.nameEnterprise,
      'nameUser': instance.nameUser,
      'mobile': instance.mobile,
      'fk_regoin': instance.fkRegoin,
      'name_regoin': instance.nameRegoin,
      'name_client': instance.nameClient,
    };
