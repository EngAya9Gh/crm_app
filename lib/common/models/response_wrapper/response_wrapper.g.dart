// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseWrapper<T> _$$_ResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ResponseWrapper<T>(
      status: json['status'] as String?,
      success: json['success'] as bool?,
      data: _$nullableGenericFromJson(json['message'], fromJsonT),
    );

Map<String, dynamic> _$$_ResponseWrapperToJson<T>(
  _$_ResponseWrapper<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'message': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
