import 'dart:core';

 enum Status {
  initial,
  loading,
  success,
  fail,
}

class BlocStatus {
  final Status status;

  ///Example
  ///
  ///class   _____State {
  /// final   BlocStatusN _____Status;
  /// final   BlocStatusN _____Status;
  ///
  /// const  NotificationState({ this.____Status=const  BlocStatus(),
  ///      this._____Status=const BlocStatusN()});
  // const BlocStatus._() : error = null,status =_Sta;
  final String? error;
  const BlocStatus.loading()
      : status = Status.loading,
        error = null;
  const BlocStatus.success()
      : status = Status.success,
        error = null;
  const BlocStatus.fail({required this.error}) : status = Status.fail;
  const BlocStatus.initial()
      : status = Status.initial,
        error = null;

  bool isLoading() => status == Status.loading;
  bool isInitial() => status == Status.initial;
  bool isFail() => status == Status.fail;
  bool isSuccess() => status == Status.success;
}
