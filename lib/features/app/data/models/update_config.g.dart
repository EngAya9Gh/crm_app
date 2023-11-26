// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateConfigImpl _$$UpdateConfigImplFromJson(Map<String, dynamic> json) =>
    _$UpdateConfigImpl(
      idVersion: json['id_version'] as String?,
      nameVersion: json['name_version'] as String?,
      linkVersion: json['link_version'] as String?,
      typeVersion:
          UpdateConfig.typeVersionFromJson(json['type_version'] as String?),
      isRequired:
          UpdateConfig.isRequiredFromJson(json['is_required'] as String?),
    );

Map<String, dynamic> _$$UpdateConfigImplToJson(_$UpdateConfigImpl instance) =>
    <String, dynamic>{
      'id_version': instance.idVersion,
      'name_version': instance.nameVersion,
      'link_version': instance.linkVersion,
      'type_version': _$PlatformUpdateVersionEnumMap[instance.typeVersion],
      'is_required': instance.isRequired,
    };

const _$PlatformUpdateVersionEnumMap = {
  PlatformUpdateVersion.android: 'android',
  PlatformUpdateVersion.ios: 'ios',
};
