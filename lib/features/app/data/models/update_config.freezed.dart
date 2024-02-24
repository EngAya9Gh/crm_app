// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateConfig _$UpdateConfigFromJson(Map<String, dynamic> json) {
  return _UpdateConfig.fromJson(json);
}

/// @nodoc
mixin _$UpdateConfig {
  @JsonKey(name: "id_version")
  String? get idVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "name_version")
  String? get nameVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "link_version")
  String? get linkVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
  PlatformUpdateVersion? get typeVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
  bool? get isRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateConfigCopyWith<UpdateConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateConfigCopyWith<$Res> {
  factory $UpdateConfigCopyWith(
          UpdateConfig value, $Res Function(UpdateConfig) then) =
      _$UpdateConfigCopyWithImpl<$Res, UpdateConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_version") String? idVersion,
      @JsonKey(name: "name_version") String? nameVersion,
      @JsonKey(name: "link_version") String? linkVersion,
      @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
      PlatformUpdateVersion? typeVersion,
      @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
      bool? isRequired});
}

/// @nodoc
class _$UpdateConfigCopyWithImpl<$Res, $Val extends UpdateConfig>
    implements $UpdateConfigCopyWith<$Res> {
  _$UpdateConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVersion = freezed,
    Object? nameVersion = freezed,
    Object? linkVersion = freezed,
    Object? typeVersion = freezed,
    Object? isRequired = freezed,
  }) {
    return _then(_value.copyWith(
      idVersion: freezed == idVersion
          ? _value.idVersion
          : idVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      linkVersion: freezed == linkVersion
          ? _value.linkVersion
          : linkVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      typeVersion: freezed == typeVersion
          ? _value.typeVersion
          : typeVersion // ignore: cast_nullable_to_non_nullable
              as PlatformUpdateVersion?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateConfigImplCopyWith<$Res>
    implements $UpdateConfigCopyWith<$Res> {
  factory _$$UpdateConfigImplCopyWith(
          _$UpdateConfigImpl value, $Res Function(_$UpdateConfigImpl) then) =
      __$$UpdateConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_version") String? idVersion,
      @JsonKey(name: "name_version") String? nameVersion,
      @JsonKey(name: "link_version") String? linkVersion,
      @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
      PlatformUpdateVersion? typeVersion,
      @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
      bool? isRequired});
}

/// @nodoc
class __$$UpdateConfigImplCopyWithImpl<$Res>
    extends _$UpdateConfigCopyWithImpl<$Res, _$UpdateConfigImpl>
    implements _$$UpdateConfigImplCopyWith<$Res> {
  __$$UpdateConfigImplCopyWithImpl(
      _$UpdateConfigImpl _value, $Res Function(_$UpdateConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idVersion = freezed,
    Object? nameVersion = freezed,
    Object? linkVersion = freezed,
    Object? typeVersion = freezed,
    Object? isRequired = freezed,
  }) {
    return _then(_$UpdateConfigImpl(
      idVersion: freezed == idVersion
          ? _value.idVersion
          : idVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVersion: freezed == nameVersion
          ? _value.nameVersion
          : nameVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      linkVersion: freezed == linkVersion
          ? _value.linkVersion
          : linkVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      typeVersion: freezed == typeVersion
          ? _value.typeVersion
          : typeVersion // ignore: cast_nullable_to_non_nullable
              as PlatformUpdateVersion?,
      isRequired: freezed == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateConfigImpl extends _UpdateConfig {
  const _$UpdateConfigImpl(
      {@JsonKey(name: "id_version") this.idVersion,
      @JsonKey(name: "name_version") this.nameVersion,
      @JsonKey(name: "link_version") this.linkVersion,
      @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
      this.typeVersion,
      @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
      this.isRequired})
      : super._();

  factory _$UpdateConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateConfigImplFromJson(json);

  @override
  @JsonKey(name: "id_version")
  final String? idVersion;
  @override
  @JsonKey(name: "name_version")
  final String? nameVersion;
  @override
  @JsonKey(name: "link_version")
  final String? linkVersion;
  @override
  @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
  final PlatformUpdateVersion? typeVersion;
  @override
  @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
  final bool? isRequired;

  @override
  String toString() {
    return 'UpdateConfig(idVersion: $idVersion, nameVersion: $nameVersion, linkVersion: $linkVersion, typeVersion: $typeVersion, isRequired: $isRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateConfigImpl &&
            (identical(other.idVersion, idVersion) ||
                other.idVersion == idVersion) &&
            (identical(other.nameVersion, nameVersion) ||
                other.nameVersion == nameVersion) &&
            (identical(other.linkVersion, linkVersion) ||
                other.linkVersion == linkVersion) &&
            (identical(other.typeVersion, typeVersion) ||
                other.typeVersion == typeVersion) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idVersion, nameVersion,
      linkVersion, typeVersion, isRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateConfigImplCopyWith<_$UpdateConfigImpl> get copyWith =>
      __$$UpdateConfigImplCopyWithImpl<_$UpdateConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateConfigImplToJson(
      this,
    );
  }
}

abstract class _UpdateConfig extends UpdateConfig {
  const factory _UpdateConfig(
      {@JsonKey(name: "id_version") final String? idVersion,
      @JsonKey(name: "name_version") final String? nameVersion,
      @JsonKey(name: "link_version") final String? linkVersion,
      @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
      final PlatformUpdateVersion? typeVersion,
      @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
      final bool? isRequired}) = _$UpdateConfigImpl;
  const _UpdateConfig._() : super._();

  factory _UpdateConfig.fromJson(Map<String, dynamic> json) =
      _$UpdateConfigImpl.fromJson;

  @override
  @JsonKey(name: "id_version")
  String? get idVersion;
  @override
  @JsonKey(name: "name_version")
  String? get nameVersion;
  @override
  @JsonKey(name: "link_version")
  String? get linkVersion;
  @override
  @JsonKey(name: "type_version", fromJson: UpdateConfig.typeVersionFromJson)
  PlatformUpdateVersion? get typeVersion;
  @override
  @JsonKey(name: "is_required", fromJson: UpdateConfig.isRequiredFromJson)
  bool? get isRequired;
  @override
  @JsonKey(ignore: true)
  _$$UpdateConfigImplCopyWith<_$UpdateConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
