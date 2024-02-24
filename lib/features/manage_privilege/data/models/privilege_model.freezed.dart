// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privilege_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivilegeModel _$PrivilegeModelFromJson(Map<String, dynamic> json) {
  return _PrivilegeModel.fromJson(json);
}

/// @nodoc
mixin _$PrivilegeModel {
  @JsonKey(name: "id_privg_user")
  String? get idPrivilegeUser => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_level")
  String? get fkLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_privileg")
  String? get fkPrivilege => throw _privateConstructorUsedError;
  @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
  bool? get isCheck => throw _privateConstructorUsedError;
  @JsonKey(name: "name_privilege")
  String? get namePrivilege => throw _privateConstructorUsedError;
  @JsonKey(name: "type_prv")
  String? get typePrv => throw _privateConstructorUsedError;
  @JsonKey(name: "periorty")
  String? get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivilegeModelCopyWith<PrivilegeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivilegeModelCopyWith<$Res> {
  factory $PrivilegeModelCopyWith(
          PrivilegeModel value, $Res Function(PrivilegeModel) then) =
      _$PrivilegeModelCopyWithImpl<$Res, PrivilegeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_privg_user") String? idPrivilegeUser,
      @JsonKey(name: "fk_level") String? fkLevel,
      @JsonKey(name: "fk_privileg") String? fkPrivilege,
      @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
      bool? isCheck,
      @JsonKey(name: "name_privilege") String? namePrivilege,
      @JsonKey(name: "type_prv") String? typePrv,
      @JsonKey(name: "periorty") String? priority});
}

/// @nodoc
class _$PrivilegeModelCopyWithImpl<$Res, $Val extends PrivilegeModel>
    implements $PrivilegeModelCopyWith<$Res> {
  _$PrivilegeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPrivilegeUser = freezed,
    Object? fkLevel = freezed,
    Object? fkPrivilege = freezed,
    Object? isCheck = freezed,
    Object? namePrivilege = freezed,
    Object? typePrv = freezed,
    Object? priority = freezed,
  }) {
    return _then(_value.copyWith(
      idPrivilegeUser: freezed == idPrivilegeUser
          ? _value.idPrivilegeUser
          : idPrivilegeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      fkLevel: freezed == fkLevel
          ? _value.fkLevel
          : fkLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      fkPrivilege: freezed == fkPrivilege
          ? _value.fkPrivilege
          : fkPrivilege // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheck: freezed == isCheck
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
      namePrivilege: freezed == namePrivilege
          ? _value.namePrivilege
          : namePrivilege // ignore: cast_nullable_to_non_nullable
              as String?,
      typePrv: freezed == typePrv
          ? _value.typePrv
          : typePrv // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivilegeModelImplCopyWith<$Res>
    implements $PrivilegeModelCopyWith<$Res> {
  factory _$$PrivilegeModelImplCopyWith(_$PrivilegeModelImpl value,
          $Res Function(_$PrivilegeModelImpl) then) =
      __$$PrivilegeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_privg_user") String? idPrivilegeUser,
      @JsonKey(name: "fk_level") String? fkLevel,
      @JsonKey(name: "fk_privileg") String? fkPrivilege,
      @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
      bool? isCheck,
      @JsonKey(name: "name_privilege") String? namePrivilege,
      @JsonKey(name: "type_prv") String? typePrv,
      @JsonKey(name: "periorty") String? priority});
}

/// @nodoc
class __$$PrivilegeModelImplCopyWithImpl<$Res>
    extends _$PrivilegeModelCopyWithImpl<$Res, _$PrivilegeModelImpl>
    implements _$$PrivilegeModelImplCopyWith<$Res> {
  __$$PrivilegeModelImplCopyWithImpl(
      _$PrivilegeModelImpl _value, $Res Function(_$PrivilegeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPrivilegeUser = freezed,
    Object? fkLevel = freezed,
    Object? fkPrivilege = freezed,
    Object? isCheck = freezed,
    Object? namePrivilege = freezed,
    Object? typePrv = freezed,
    Object? priority = freezed,
  }) {
    return _then(_$PrivilegeModelImpl(
      idPrivilegeUser: freezed == idPrivilegeUser
          ? _value.idPrivilegeUser
          : idPrivilegeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      fkLevel: freezed == fkLevel
          ? _value.fkLevel
          : fkLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      fkPrivilege: freezed == fkPrivilege
          ? _value.fkPrivilege
          : fkPrivilege // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheck: freezed == isCheck
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
      namePrivilege: freezed == namePrivilege
          ? _value.namePrivilege
          : namePrivilege // ignore: cast_nullable_to_non_nullable
              as String?,
      typePrv: freezed == typePrv
          ? _value.typePrv
          : typePrv // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivilegeModelImpl extends _PrivilegeModel {
  const _$PrivilegeModelImpl(
      {@JsonKey(name: "id_privg_user") this.idPrivilegeUser,
      @JsonKey(name: "fk_level") this.fkLevel,
      @JsonKey(name: "fk_privileg") this.fkPrivilege,
      @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
      this.isCheck,
      @JsonKey(name: "name_privilege") this.namePrivilege,
      @JsonKey(name: "type_prv") this.typePrv,
      @JsonKey(name: "periorty") this.priority})
      : super._();

  factory _$PrivilegeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivilegeModelImplFromJson(json);

  @override
  @JsonKey(name: "id_privg_user")
  final String? idPrivilegeUser;
  @override
  @JsonKey(name: "fk_level")
  final String? fkLevel;
  @override
  @JsonKey(name: "fk_privileg")
  final String? fkPrivilege;
  @override
  @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
  final bool? isCheck;
  @override
  @JsonKey(name: "name_privilege")
  final String? namePrivilege;
  @override
  @JsonKey(name: "type_prv")
  final String? typePrv;
  @override
  @JsonKey(name: "periorty")
  final String? priority;

  @override
  String toString() {
    return 'PrivilegeModel(idPrivilegeUser: $idPrivilegeUser, fkLevel: $fkLevel, fkPrivilege: $fkPrivilege, isCheck: $isCheck, namePrivilege: $namePrivilege, typePrv: $typePrv, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivilegeModelImpl &&
            (identical(other.idPrivilegeUser, idPrivilegeUser) ||
                other.idPrivilegeUser == idPrivilegeUser) &&
            (identical(other.fkLevel, fkLevel) || other.fkLevel == fkLevel) &&
            (identical(other.fkPrivilege, fkPrivilege) ||
                other.fkPrivilege == fkPrivilege) &&
            (identical(other.isCheck, isCheck) || other.isCheck == isCheck) &&
            (identical(other.namePrivilege, namePrivilege) ||
                other.namePrivilege == namePrivilege) &&
            (identical(other.typePrv, typePrv) || other.typePrv == typePrv) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idPrivilegeUser, fkLevel,
      fkPrivilege, isCheck, namePrivilege, typePrv, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivilegeModelImplCopyWith<_$PrivilegeModelImpl> get copyWith =>
      __$$PrivilegeModelImplCopyWithImpl<_$PrivilegeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivilegeModelImplToJson(
      this,
    );
  }
}

abstract class _PrivilegeModel extends PrivilegeModel {
  const factory _PrivilegeModel(
          {@JsonKey(name: "id_privg_user") final String? idPrivilegeUser,
          @JsonKey(name: "fk_level") final String? fkLevel,
          @JsonKey(name: "fk_privileg") final String? fkPrivilege,
          @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
          final bool? isCheck,
          @JsonKey(name: "name_privilege") final String? namePrivilege,
          @JsonKey(name: "type_prv") final String? typePrv,
          @JsonKey(name: "periorty") final String? priority}) =
      _$PrivilegeModelImpl;
  const _PrivilegeModel._() : super._();

  factory _PrivilegeModel.fromJson(Map<String, dynamic> json) =
      _$PrivilegeModelImpl.fromJson;

  @override
  @JsonKey(name: "id_privg_user")
  String? get idPrivilegeUser;
  @override
  @JsonKey(name: "fk_level")
  String? get fkLevel;
  @override
  @JsonKey(name: "fk_privileg")
  String? get fkPrivilege;
  @override
  @JsonKey(name: "is_check", fromJson: PrivilegeModel.isCheckFromJson)
  bool? get isCheck;
  @override
  @JsonKey(name: "name_privilege")
  String? get namePrivilege;
  @override
  @JsonKey(name: "type_prv")
  String? get typePrv;
  @override
  @JsonKey(name: "periorty")
  String? get priority;
  @override
  @JsonKey(ignore: true)
  _$$PrivilegeModelImplCopyWith<_$PrivilegeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
