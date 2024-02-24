// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_region_department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegionDepartment _$UserRegionDepartmentFromJson(Map<String, dynamic> json) {
  return _UserRegionDepartment.fromJson(json);
}

/// @nodoc
mixin _$UserRegionDepartment {
  @JsonKey(name: "id_user")
  int? get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: "type_administration")
  String? get typeAdministration => throw _privateConstructorUsedError;
  @JsonKey(name: "fk_regoin")
  int? get fkRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "nameUser")
  String? get nameUser => throw _privateConstructorUsedError;
  @JsonKey(name: "managements")
  Managements? get managements => throw _privateConstructorUsedError;
  @JsonKey(name: "regions")
  Regions? get regions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegionDepartmentCopyWith<UserRegionDepartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegionDepartmentCopyWith<$Res> {
  factory $UserRegionDepartmentCopyWith(UserRegionDepartment value,
          $Res Function(UserRegionDepartment) then) =
      _$UserRegionDepartmentCopyWithImpl<$Res, UserRegionDepartment>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_user") int? idUser,
      @JsonKey(name: "type_administration") String? typeAdministration,
      @JsonKey(name: "fk_regoin") int? fkRegoin,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "managements") Managements? managements,
      @JsonKey(name: "regions") Regions? regions});

  $ManagementsCopyWith<$Res>? get managements;
  $RegionsCopyWith<$Res>? get regions;
}

/// @nodoc
class _$UserRegionDepartmentCopyWithImpl<$Res,
        $Val extends UserRegionDepartment>
    implements $UserRegionDepartmentCopyWith<$Res> {
  _$UserRegionDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? typeAdministration = freezed,
    Object? fkRegoin = freezed,
    Object? nameUser = freezed,
    Object? managements = freezed,
    Object? regions = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int?,
      typeAdministration: freezed == typeAdministration
          ? _value.typeAdministration
          : typeAdministration // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as int?,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      managements: freezed == managements
          ? _value.managements
          : managements // ignore: cast_nullable_to_non_nullable
              as Managements?,
      regions: freezed == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as Regions?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ManagementsCopyWith<$Res>? get managements {
    if (_value.managements == null) {
      return null;
    }

    return $ManagementsCopyWith<$Res>(_value.managements!, (value) {
      return _then(_value.copyWith(managements: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RegionsCopyWith<$Res>? get regions {
    if (_value.regions == null) {
      return null;
    }

    return $RegionsCopyWith<$Res>(_value.regions!, (value) {
      return _then(_value.copyWith(regions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRegionDepartmentImplCopyWith<$Res>
    implements $UserRegionDepartmentCopyWith<$Res> {
  factory _$$UserRegionDepartmentImplCopyWith(_$UserRegionDepartmentImpl value,
          $Res Function(_$UserRegionDepartmentImpl) then) =
      __$$UserRegionDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_user") int? idUser,
      @JsonKey(name: "type_administration") String? typeAdministration,
      @JsonKey(name: "fk_regoin") int? fkRegoin,
      @JsonKey(name: "nameUser") String? nameUser,
      @JsonKey(name: "managements") Managements? managements,
      @JsonKey(name: "regions") Regions? regions});

  @override
  $ManagementsCopyWith<$Res>? get managements;
  @override
  $RegionsCopyWith<$Res>? get regions;
}

/// @nodoc
class __$$UserRegionDepartmentImplCopyWithImpl<$Res>
    extends _$UserRegionDepartmentCopyWithImpl<$Res, _$UserRegionDepartmentImpl>
    implements _$$UserRegionDepartmentImplCopyWith<$Res> {
  __$$UserRegionDepartmentImplCopyWithImpl(_$UserRegionDepartmentImpl _value,
      $Res Function(_$UserRegionDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = freezed,
    Object? typeAdministration = freezed,
    Object? fkRegoin = freezed,
    Object? nameUser = freezed,
    Object? managements = freezed,
    Object? regions = freezed,
  }) {
    return _then(_$UserRegionDepartmentImpl(
      idUser: freezed == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int?,
      typeAdministration: freezed == typeAdministration
          ? _value.typeAdministration
          : typeAdministration // ignore: cast_nullable_to_non_nullable
              as String?,
      fkRegoin: freezed == fkRegoin
          ? _value.fkRegoin
          : fkRegoin // ignore: cast_nullable_to_non_nullable
              as int?,
      nameUser: freezed == nameUser
          ? _value.nameUser
          : nameUser // ignore: cast_nullable_to_non_nullable
              as String?,
      managements: freezed == managements
          ? _value.managements
          : managements // ignore: cast_nullable_to_non_nullable
              as Managements?,
      regions: freezed == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as Regions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegionDepartmentImpl implements _UserRegionDepartment {
  const _$UserRegionDepartmentImpl(
      {@JsonKey(name: "id_user") this.idUser,
      @JsonKey(name: "type_administration") this.typeAdministration,
      @JsonKey(name: "fk_regoin") this.fkRegoin,
      @JsonKey(name: "nameUser") this.nameUser,
      @JsonKey(name: "managements") this.managements,
      @JsonKey(name: "regions") this.regions});

  factory _$UserRegionDepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegionDepartmentImplFromJson(json);

  @override
  @JsonKey(name: "id_user")
  final int? idUser;
  @override
  @JsonKey(name: "type_administration")
  final String? typeAdministration;
  @override
  @JsonKey(name: "fk_regoin")
  final int? fkRegoin;
  @override
  @JsonKey(name: "nameUser")
  final String? nameUser;
  @override
  @JsonKey(name: "managements")
  final Managements? managements;
  @override
  @JsonKey(name: "regions")
  final Regions? regions;

  @override
  String toString() {
    return 'UserRegionDepartment(idUser: $idUser, typeAdministration: $typeAdministration, fkRegoin: $fkRegoin, nameUser: $nameUser, managements: $managements, regions: $regions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegionDepartmentImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.typeAdministration, typeAdministration) ||
                other.typeAdministration == typeAdministration) &&
            (identical(other.fkRegoin, fkRegoin) ||
                other.fkRegoin == fkRegoin) &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            (identical(other.managements, managements) ||
                other.managements == managements) &&
            (identical(other.regions, regions) || other.regions == regions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser, typeAdministration,
      fkRegoin, nameUser, managements, regions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegionDepartmentImplCopyWith<_$UserRegionDepartmentImpl>
      get copyWith =>
          __$$UserRegionDepartmentImplCopyWithImpl<_$UserRegionDepartmentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegionDepartmentImplToJson(
      this,
    );
  }
}

abstract class _UserRegionDepartment implements UserRegionDepartment {
  const factory _UserRegionDepartment(
      {@JsonKey(name: "id_user") final int? idUser,
      @JsonKey(name: "type_administration") final String? typeAdministration,
      @JsonKey(name: "fk_regoin") final int? fkRegoin,
      @JsonKey(name: "nameUser") final String? nameUser,
      @JsonKey(name: "managements") final Managements? managements,
      @JsonKey(name: "regions")
      final Regions? regions}) = _$UserRegionDepartmentImpl;

  factory _UserRegionDepartment.fromJson(Map<String, dynamic> json) =
      _$UserRegionDepartmentImpl.fromJson;

  @override
  @JsonKey(name: "id_user")
  int? get idUser;
  @override
  @JsonKey(name: "type_administration")
  String? get typeAdministration;
  @override
  @JsonKey(name: "fk_regoin")
  int? get fkRegoin;
  @override
  @JsonKey(name: "nameUser")
  String? get nameUser;
  @override
  @JsonKey(name: "managements")
  Managements? get managements;
  @override
  @JsonKey(name: "regions")
  Regions? get regions;
  @override
  @JsonKey(ignore: true)
  _$$UserRegionDepartmentImplCopyWith<_$UserRegionDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Managements _$ManagementsFromJson(Map<String, dynamic> json) {
  return _Managements.fromJson(json);
}

/// @nodoc
mixin _$Managements {
  @JsonKey(name: "idmange")
  int? get idmange => throw _privateConstructorUsedError;
  @JsonKey(name: "name_mange")
  String? get nameMange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagementsCopyWith<Managements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementsCopyWith<$Res> {
  factory $ManagementsCopyWith(
          Managements value, $Res Function(Managements) then) =
      _$ManagementsCopyWithImpl<$Res, Managements>;
  @useResult
  $Res call(
      {@JsonKey(name: "idmange") int? idmange,
      @JsonKey(name: "name_mange") String? nameMange});
}

/// @nodoc
class _$ManagementsCopyWithImpl<$Res, $Val extends Managements>
    implements $ManagementsCopyWith<$Res> {
  _$ManagementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idmange = freezed,
    Object? nameMange = freezed,
  }) {
    return _then(_value.copyWith(
      idmange: freezed == idmange
          ? _value.idmange
          : idmange // ignore: cast_nullable_to_non_nullable
              as int?,
      nameMange: freezed == nameMange
          ? _value.nameMange
          : nameMange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManagementsImplCopyWith<$Res>
    implements $ManagementsCopyWith<$Res> {
  factory _$$ManagementsImplCopyWith(
          _$ManagementsImpl value, $Res Function(_$ManagementsImpl) then) =
      __$$ManagementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "idmange") int? idmange,
      @JsonKey(name: "name_mange") String? nameMange});
}

/// @nodoc
class __$$ManagementsImplCopyWithImpl<$Res>
    extends _$ManagementsCopyWithImpl<$Res, _$ManagementsImpl>
    implements _$$ManagementsImplCopyWith<$Res> {
  __$$ManagementsImplCopyWithImpl(
      _$ManagementsImpl _value, $Res Function(_$ManagementsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idmange = freezed,
    Object? nameMange = freezed,
  }) {
    return _then(_$ManagementsImpl(
      idmange: freezed == idmange
          ? _value.idmange
          : idmange // ignore: cast_nullable_to_non_nullable
              as int?,
      nameMange: freezed == nameMange
          ? _value.nameMange
          : nameMange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManagementsImpl implements _Managements {
  const _$ManagementsImpl(
      {@JsonKey(name: "idmange") this.idmange,
      @JsonKey(name: "name_mange") this.nameMange});

  factory _$ManagementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManagementsImplFromJson(json);

  @override
  @JsonKey(name: "idmange")
  final int? idmange;
  @override
  @JsonKey(name: "name_mange")
  final String? nameMange;

  @override
  String toString() {
    return 'Managements(idmange: $idmange, nameMange: $nameMange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManagementsImpl &&
            (identical(other.idmange, idmange) || other.idmange == idmange) &&
            (identical(other.nameMange, nameMange) ||
                other.nameMange == nameMange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idmange, nameMange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManagementsImplCopyWith<_$ManagementsImpl> get copyWith =>
      __$$ManagementsImplCopyWithImpl<_$ManagementsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManagementsImplToJson(
      this,
    );
  }
}

abstract class _Managements implements Managements {
  const factory _Managements(
          {@JsonKey(name: "idmange") final int? idmange,
          @JsonKey(name: "name_mange") final String? nameMange}) =
      _$ManagementsImpl;

  factory _Managements.fromJson(Map<String, dynamic> json) =
      _$ManagementsImpl.fromJson;

  @override
  @JsonKey(name: "idmange")
  int? get idmange;
  @override
  @JsonKey(name: "name_mange")
  String? get nameMange;
  @override
  @JsonKey(ignore: true)
  _$$ManagementsImplCopyWith<_$ManagementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Regions _$RegionsFromJson(Map<String, dynamic> json) {
  return _Regions.fromJson(json);
}

/// @nodoc
mixin _$Regions {
  @JsonKey(name: "name_regoin")
  String? get nameRegoin => throw _privateConstructorUsedError;
  @JsonKey(name: "id_regoin")
  int? get idRegoin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionsCopyWith<Regions> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionsCopyWith<$Res> {
  factory $RegionsCopyWith(Regions value, $Res Function(Regions) then) =
      _$RegionsCopyWithImpl<$Res, Regions>;
  @useResult
  $Res call(
      {@JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "id_regoin") int? idRegoin});
}

/// @nodoc
class _$RegionsCopyWithImpl<$Res, $Val extends Regions>
    implements $RegionsCopyWith<$Res> {
  _$RegionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameRegoin = freezed,
    Object? idRegoin = freezed,
  }) {
    return _then(_value.copyWith(
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      idRegoin: freezed == idRegoin
          ? _value.idRegoin
          : idRegoin // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionsImplCopyWith<$Res> implements $RegionsCopyWith<$Res> {
  factory _$$RegionsImplCopyWith(
          _$RegionsImpl value, $Res Function(_$RegionsImpl) then) =
      __$$RegionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name_regoin") String? nameRegoin,
      @JsonKey(name: "id_regoin") int? idRegoin});
}

/// @nodoc
class __$$RegionsImplCopyWithImpl<$Res>
    extends _$RegionsCopyWithImpl<$Res, _$RegionsImpl>
    implements _$$RegionsImplCopyWith<$Res> {
  __$$RegionsImplCopyWithImpl(
      _$RegionsImpl _value, $Res Function(_$RegionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameRegoin = freezed,
    Object? idRegoin = freezed,
  }) {
    return _then(_$RegionsImpl(
      nameRegoin: freezed == nameRegoin
          ? _value.nameRegoin
          : nameRegoin // ignore: cast_nullable_to_non_nullable
              as String?,
      idRegoin: freezed == idRegoin
          ? _value.idRegoin
          : idRegoin // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionsImpl implements _Regions {
  const _$RegionsImpl(
      {@JsonKey(name: "name_regoin") this.nameRegoin,
      @JsonKey(name: "id_regoin") this.idRegoin});

  factory _$RegionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionsImplFromJson(json);

  @override
  @JsonKey(name: "name_regoin")
  final String? nameRegoin;
  @override
  @JsonKey(name: "id_regoin")
  final int? idRegoin;

  @override
  String toString() {
    return 'Regions(nameRegoin: $nameRegoin, idRegoin: $idRegoin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionsImpl &&
            (identical(other.nameRegoin, nameRegoin) ||
                other.nameRegoin == nameRegoin) &&
            (identical(other.idRegoin, idRegoin) ||
                other.idRegoin == idRegoin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nameRegoin, idRegoin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionsImplCopyWith<_$RegionsImpl> get copyWith =>
      __$$RegionsImplCopyWithImpl<_$RegionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionsImplToJson(
      this,
    );
  }
}

abstract class _Regions implements Regions {
  const factory _Regions(
      {@JsonKey(name: "name_regoin") final String? nameRegoin,
      @JsonKey(name: "id_regoin") final int? idRegoin}) = _$RegionsImpl;

  factory _Regions.fromJson(Map<String, dynamic> json) = _$RegionsImpl.fromJson;

  @override
  @JsonKey(name: "name_regoin")
  String? get nameRegoin;
  @override
  @JsonKey(name: "id_regoin")
  int? get idRegoin;
  @override
  @JsonKey(ignore: true)
  _$$RegionsImplCopyWith<_$RegionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
