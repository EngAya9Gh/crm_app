// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) {
  return _LevelModel.fromJson(json);
}

/// @nodoc
mixin _$LevelModel {
  @JsonKey(name: "id_level")
  String? get idLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "name_level")
  String? get nameLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "periorty")
  String? get periorty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelModelCopyWith<LevelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelModelCopyWith<$Res> {
  factory $LevelModelCopyWith(
          LevelModel value, $Res Function(LevelModel) then) =
      _$LevelModelCopyWithImpl<$Res, LevelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_level") String? idLevel,
      @JsonKey(name: "name_level") String? nameLevel,
      @JsonKey(name: "periorty") String? periorty});
}

/// @nodoc
class _$LevelModelCopyWithImpl<$Res, $Val extends LevelModel>
    implements $LevelModelCopyWith<$Res> {
  _$LevelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLevel = freezed,
    Object? nameLevel = freezed,
    Object? periorty = freezed,
  }) {
    return _then(_value.copyWith(
      idLevel: freezed == idLevel
          ? _value.idLevel
          : idLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      nameLevel: freezed == nameLevel
          ? _value.nameLevel
          : nameLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      periorty: freezed == periorty
          ? _value.periorty
          : periorty // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LevelModelImplCopyWith<$Res>
    implements $LevelModelCopyWith<$Res> {
  factory _$$LevelModelImplCopyWith(
          _$LevelModelImpl value, $Res Function(_$LevelModelImpl) then) =
      __$$LevelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_level") String? idLevel,
      @JsonKey(name: "name_level") String? nameLevel,
      @JsonKey(name: "periorty") String? periorty});
}

/// @nodoc
class __$$LevelModelImplCopyWithImpl<$Res>
    extends _$LevelModelCopyWithImpl<$Res, _$LevelModelImpl>
    implements _$$LevelModelImplCopyWith<$Res> {
  __$$LevelModelImplCopyWithImpl(
      _$LevelModelImpl _value, $Res Function(_$LevelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLevel = freezed,
    Object? nameLevel = freezed,
    Object? periorty = freezed,
  }) {
    return _then(_$LevelModelImpl(
      idLevel: freezed == idLevel
          ? _value.idLevel
          : idLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      nameLevel: freezed == nameLevel
          ? _value.nameLevel
          : nameLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      periorty: freezed == periorty
          ? _value.periorty
          : periorty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LevelModelImpl implements _LevelModel {
  const _$LevelModelImpl(
      {@JsonKey(name: "id_level") this.idLevel,
      @JsonKey(name: "name_level") this.nameLevel,
      @JsonKey(name: "periorty") this.periorty});

  factory _$LevelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LevelModelImplFromJson(json);

  @override
  @JsonKey(name: "id_level")
  final String? idLevel;
  @override
  @JsonKey(name: "name_level")
  final String? nameLevel;
  @override
  @JsonKey(name: "periorty")
  final String? periorty;

  @override
  String toString() {
    return 'LevelModel(idLevel: $idLevel, nameLevel: $nameLevel, periorty: $periorty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelModelImpl &&
            (identical(other.idLevel, idLevel) || other.idLevel == idLevel) &&
            (identical(other.nameLevel, nameLevel) ||
                other.nameLevel == nameLevel) &&
            (identical(other.periorty, periorty) ||
                other.periorty == periorty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idLevel, nameLevel, periorty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelModelImplCopyWith<_$LevelModelImpl> get copyWith =>
      __$$LevelModelImplCopyWithImpl<_$LevelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LevelModelImplToJson(
      this,
    );
  }
}

abstract class _LevelModel implements LevelModel {
  const factory _LevelModel(
      {@JsonKey(name: "id_level") final String? idLevel,
      @JsonKey(name: "name_level") final String? nameLevel,
      @JsonKey(name: "periorty") final String? periorty}) = _$LevelModelImpl;

  factory _LevelModel.fromJson(Map<String, dynamic> json) =
      _$LevelModelImpl.fromJson;

  @override
  @JsonKey(name: "id_level")
  String? get idLevel;
  @override
  @JsonKey(name: "name_level")
  String? get nameLevel;
  @override
  @JsonKey(name: "periorty")
  String? get periorty;
  @override
  @JsonKey(ignore: true)
  _$$LevelModelImplCopyWith<_$LevelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
