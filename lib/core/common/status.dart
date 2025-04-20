import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const Status._();

  const factory Status.initial() = _Initial;
  const factory Status.loading() = _Loading;
  const factory Status.success(dynamic data) = _Success;
  const factory Status.error(String message) = _Error;
  const factory Status.empty() = _Empty;

  bool get isLoading => maybeWhen(
    loading: () => true,
    orElse: () => false,
  );

  bool get isSuccess => maybeWhen(
    success: (_) => true,
    orElse: () => false,
  );
} 