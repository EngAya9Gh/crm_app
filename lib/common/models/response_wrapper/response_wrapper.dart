import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper.freezed.dart';
part 'response_wrapper.g.dart';

@Freezed(genericArgumentFactories: true)
class ResponseWrapper<T> with _$ResponseWrapper<T> {
  const factory ResponseWrapper({
    final String? status,
    final bool? success,
    @JsonKey(name: "message") required final T? message,
    @JsonKey(name: "data") required final T? data,
  }) = _ResponseWrapper;

  factory ResponseWrapper.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
}
