part of 'periodic_communication_cubit.dart';

class PeriodicCommunicationState extends Equatable {
  final BlocStatus getPeriodicCommunicationStatus;
  final BlocStatus filterPeriodicCommunicationStatus;

  PeriodicCommunicationState({
    this.getPeriodicCommunicationStatus = const BlocStatus.initial(),
    this.filterPeriodicCommunicationStatus = const BlocStatus.initial(),
  });

  PeriodicCommunicationState copyWith({
    BlocStatus? getPeriodicCommunicationStatus,
    BlocStatus? filterPeriodicCommunicationStatus,
  }) {
    return PeriodicCommunicationState(
      getPeriodicCommunicationStatus:
          getPeriodicCommunicationStatus ?? this.getPeriodicCommunicationStatus,
      filterPeriodicCommunicationStatus: filterPeriodicCommunicationStatus ??
          this.filterPeriodicCommunicationStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getPeriodicCommunicationStatus,
      filterPeriodicCommunicationStatus,
    ];
  }
}
