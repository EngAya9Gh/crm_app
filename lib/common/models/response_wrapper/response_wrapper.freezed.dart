// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseWrapper<T> _$ResponseWrapperFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseWrapper<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseWrapper<T> {
  String? get status => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseWrapperCopyWith<T, ResponseWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWrapperCopyWith<T, $Res> {
  factory $ResponseWrapperCopyWith(
          ResponseWrapper<T> value, $Res Function(ResponseWrapper<T>) then) =
      _$ResponseWrapperCopyWithImpl<T, $Res, ResponseWrapper<T>>;
  @useResult
  $Res call({String? status, bool? success, @JsonKey(name: "message") T? data});
}

/// @nodoc
class _$ResponseWrapperCopyWithImpl<T, $Res, $Val extends ResponseWrapper<T>>
    implements $ResponseWrapperCopyWith<T, $Res> {
  _$ResponseWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseWrapperCopyWith<T, $Res>
    implements $ResponseWrapperCopyWith<T, $Res> {
  factory _$$_ResponseWrapperCopyWith(_$_ResponseWrapper<T> value,
          $Res Function(_$_ResponseWrapper<T>) then) =
      __$$_ResponseWrapperCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? status, bool? success, @JsonKey(name: "message") T? data});
}

/// @nodoc
class __$$_ResponseWrapperCopyWithImpl<T, $Res>
    extends _$ResponseWrapperCopyWithImpl<T, $Res, _$_ResponseWrapper<T>>
    implements _$$_ResponseWrapperCopyWith<T, $Res> {
  __$$_ResponseWrapperCopyWithImpl(
      _$_ResponseWrapper<T> _value, $Res Function(_$_ResponseWrapper<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ResponseWrapper<T>(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ResponseWrapper<T> implements _ResponseWrapper<T> {
  const _$_ResponseWrapper(
      {this.status,
      this.success,
      @JsonKey(name: "message") required this.data});

  factory _$_ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ResponseWrapperFromJson(json, fromJsonT);

  @override
  final String? status;
  @override
  final bool? success;
  @override
  @JsonKey(name: "message")
  final T? data;

  @override
  String toString() {
    return 'ResponseWrapper<$T>(status: $status, success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseWrapper<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, success, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseWrapperCopyWith<T, _$_ResponseWrapper<T>> get copyWith =>
      __$$_ResponseWrapperCopyWithImpl<T, _$_ResponseWrapper<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ResponseWrapperToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseWrapper<T> implements ResponseWrapper<T> {
  const factory _ResponseWrapper(
          {final String? status,
          final bool? success,
          @JsonKey(name: "message") required final T? data}) =
      _$_ResponseWrapper<T>;

  factory _ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ResponseWrapper<T>.fromJson;

  @override
  String? get status;
  @override
  bool? get success;
  @override
  @JsonKey(name: "message")
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseWrapperCopyWith<T, _$_ResponseWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
