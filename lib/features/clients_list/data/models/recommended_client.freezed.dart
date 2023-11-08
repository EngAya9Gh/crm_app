// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommended_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendedClient _$RecommendedClientFromJson(Map<String, dynamic> json) {
  return _RecommendedClient.fromJson(json);
}

/// @nodoc
mixin _$RecommendedClient {
  @JsonKey(name: "fk_client")
  String? get fkClient => throw _privateConstructorUsedError;
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendedClientCopyWith<RecommendedClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedClientCopyWith<$Res> {
  factory $RecommendedClientCopyWith(
          RecommendedClient value, $Res Function(RecommendedClient) then) =
      _$RecommendedClientCopyWithImpl<$Res, RecommendedClient>;
  @useResult
  $Res call(
      {@JsonKey(name: "fk_client") String? fkClient,
      @JsonKey(name: "name_enterprise") String? nameEnterprise});
}

/// @nodoc
class _$RecommendedClientCopyWithImpl<$Res, $Val extends RecommendedClient>
    implements $RecommendedClientCopyWith<$Res> {
  _$RecommendedClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fkClient = freezed,
    Object? nameEnterprise = freezed,
  }) {
    return _then(_value.copyWith(
      fkClient: freezed == fkClient
          ? _value.fkClient
          : fkClient // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendedClientImplCopyWith<$Res>
    implements $RecommendedClientCopyWith<$Res> {
  factory _$$RecommendedClientImplCopyWith(_$RecommendedClientImpl value,
          $Res Function(_$RecommendedClientImpl) then) =
      __$$RecommendedClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fk_client") String? fkClient,
      @JsonKey(name: "name_enterprise") String? nameEnterprise});
}

/// @nodoc
class __$$RecommendedClientImplCopyWithImpl<$Res>
    extends _$RecommendedClientCopyWithImpl<$Res, _$RecommendedClientImpl>
    implements _$$RecommendedClientImplCopyWith<$Res> {
  __$$RecommendedClientImplCopyWithImpl(_$RecommendedClientImpl _value,
      $Res Function(_$RecommendedClientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fkClient = freezed,
    Object? nameEnterprise = freezed,
  }) {
    return _then(_$RecommendedClientImpl(
      fkClient: freezed == fkClient
          ? _value.fkClient
          : fkClient // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEnterprise: freezed == nameEnterprise
          ? _value.nameEnterprise
          : nameEnterprise // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendedClientImpl implements _RecommendedClient {
  const _$RecommendedClientImpl(
      {@JsonKey(name: "fk_client") this.fkClient,
      @JsonKey(name: "name_enterprise") this.nameEnterprise});

  factory _$RecommendedClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendedClientImplFromJson(json);

  @override
  @JsonKey(name: "fk_client")
  final String? fkClient;
  @override
  @JsonKey(name: "name_enterprise")
  final String? nameEnterprise;

  @override
  String toString() {
    return 'RecommendedClient(fkClient: $fkClient, nameEnterprise: $nameEnterprise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendedClientImpl &&
            (identical(other.fkClient, fkClient) ||
                other.fkClient == fkClient) &&
            (identical(other.nameEnterprise, nameEnterprise) ||
                other.nameEnterprise == nameEnterprise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fkClient, nameEnterprise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendedClientImplCopyWith<_$RecommendedClientImpl> get copyWith =>
      __$$RecommendedClientImplCopyWithImpl<_$RecommendedClientImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendedClientImplToJson(
      this,
    );
  }
}

abstract class _RecommendedClient implements RecommendedClient {
  const factory _RecommendedClient(
          {@JsonKey(name: "fk_client") final String? fkClient,
          @JsonKey(name: "name_enterprise") final String? nameEnterprise}) =
      _$RecommendedClientImpl;

  factory _RecommendedClient.fromJson(Map<String, dynamic> json) =
      _$RecommendedClientImpl.fromJson;

  @override
  @JsonKey(name: "fk_client")
  String? get fkClient;
  @override
  @JsonKey(name: "name_enterprise")
  String? get nameEnterprise;
  @override
  @JsonKey(ignore: true)
  _$$RecommendedClientImplCopyWith<_$RecommendedClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
