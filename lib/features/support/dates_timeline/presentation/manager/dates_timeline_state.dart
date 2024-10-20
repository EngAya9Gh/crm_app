part of 'dates_timeline_bloc.dart';

class DatesTimelineState extends Equatable {
  final BlocStatus<List<DateTimelineModel>> getDatesTimelineStatus;
  final DateTime selectedDate;
  final List<DateTimelineModel> events;

  const DatesTimelineState({
    this.getDatesTimelineStatus = const BlocStatus.initial(),
    required this.selectedDate,
     this.events= const []

  });

  DatesTimelineState copyWith({
    BlocStatus<List<DateTimelineModel>>? getDatesTimelineStatus,
    DateTime? selectedDate,
    List<DateTimelineModel>? events,

  }) {
    return DatesTimelineState(
      getDatesTimelineStatus: getDatesTimelineStatus ?? this.getDatesTimelineStatus,
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events,

    );
  }

  @override
  List<Object> get props => [getDatesTimelineStatus,selectedDate,events];
}