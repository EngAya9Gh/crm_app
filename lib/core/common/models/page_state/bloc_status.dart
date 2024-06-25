import '../../enums/enums.dart';

class BlocStatus<T> {
  final StateStatus status;
  final String? error;
  final T? data;

  const BlocStatus.loading({this.data})
      : status = StateStatus.loading,
        error = null;

  const BlocStatus.success({this.data})
      : status = StateStatus.success,
        error = null;

  const BlocStatus.fail({required this.error, this.data})
      : status = StateStatus.failure;

  const BlocStatus.initial({this.data})
      : status = StateStatus.initial,
        error = null;

  bool isInitial() => status == StateStatus.initial;

  bool isLoading() => status == StateStatus.loading;

  bool isSuccess() => status == StateStatus.success;

  bool isFailed() => status == StateStatus.failure;
}
