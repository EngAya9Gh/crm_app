part of 'dates_timeline_bloc.dart';

abstract class DateTimelineEvent extends Equatable {
  const DateTimelineEvent();

  @override
  List<Object?> get props => [];
}


class GetTimelineByEmployeeEvent extends DateTimelineEvent {
  final GetTimelineByEmployeeParams getTimelineByEmployeeParams;
  final ValueChanged<List<DateTimelineModel>>? onSuccess;

  GetTimelineByEmployeeEvent(this.getTimelineByEmployeeParams, {this.onSuccess});

  @override
  List<Object?> get props => [getTimelineByEmployeeParams];
}
