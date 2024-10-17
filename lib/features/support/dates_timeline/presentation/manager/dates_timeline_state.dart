part of 'dates_timeline_bloc.dart';

class DatesTimelineState extends Equatable {
  final BlocStatus<List<DateTimelineModel>> getDatesTimelineStatus;

  const DatesTimelineState({
    this.getDatesTimelineStatus = const BlocStatus.initial(),
  });

  DatesTimelineState copyWith({
    BlocStatus<List<DateTimelineModel>>? getDatesTimelineStatus,
  }) {
    return DatesTimelineState(
      getDatesTimelineStatus: getDatesTimelineStatus ?? this.getDatesTimelineStatus,
    );
  }

  @override
  List<Object> get props => [getDatesTimelineStatus];
}