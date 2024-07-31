import 'package:equatable/equatable.dart';

import '../../enums/enums.dart';

class BlocStatus<T> extends Equatable {
  final StateStatus status;
  final String? error;
  final T? data;

  const BlocStatus._(this.status, {this.error, this.data});

  const BlocStatus.initial({T? data}) : this._(StateStatus.initial, data: data);

  const BlocStatus.loading({T? data}) : this._(StateStatus.loading, data: data);

  const BlocStatus.success({T? data}) : this._(StateStatus.success, data: data);

  const BlocStatus.empty({T? data}) : this._(StateStatus.empty, data: data);

  const BlocStatus.fail({String? error, T? data})
      : this._(StateStatus.failure, error: error, data: data);

  bool isInitial() => status == StateStatus.initial;

  bool isLoading() => status == StateStatus.loading;

  bool isSuccess() => status == StateStatus.success;

  bool isEmpty() => status == StateStatus.empty;

  bool isFailed() => status == StateStatus.failure;

  R when<R>({
    R Function()? initial,
    required R Function() loading,
    required R Function(T? data) success,
    required R Function() empty,
    required R Function(String? error, T? data) failure,
  }) {
    switch (status) {
      case StateStatus.initial:
        return initial?.call() ?? loading();
      case StateStatus.loading:
        return loading();
      case StateStatus.success:
        return success(data);
      case StateStatus.empty:
        return empty();
      case StateStatus.failure:
        return failure(error, data);
    }
  }

  @override
  List<Object?> get props => [status, error, data];
}
