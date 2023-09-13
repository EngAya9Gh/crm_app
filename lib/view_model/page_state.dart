enum Status {init, loading, loaded, failed }

class PageState<T> {
  PageState({
    this.status = Status.loading,
    this.data,
  });

  PageState.init({
    this.status = Status.init,
    this.data,
  });

  final Status status;
  late final T? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PageState &&
              runtimeType == other.runtimeType &&
              status == other.status &&
              data == other.data;

  @override
  int get hashCode => status.hashCode ^ data.hashCode;

  PageState<T> copyWith({
    Status? status,
    T? data,
  }) {
    return PageState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  PageState<T> get changeToFailed {
    return copyWith(status: Status.failed);
  }

  PageState<T> get changeToLoading {
    return copyWith(status: Status.loading);
  }

  PageState<T> changeToLoaded(T data) {
    return copyWith(status: Status.loaded, data: data);
  }
}

extension PageStateExtension<T> on PageState<T> {
  bool get isLoading => status == Status.loading;

  bool get isSuccess => status == Status.loaded;

  bool get isFailure => status == Status.failed;

  bool get isInit => status == Status.init;
}
