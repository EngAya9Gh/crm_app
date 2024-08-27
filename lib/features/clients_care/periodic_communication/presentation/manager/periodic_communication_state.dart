part of 'periodic_communication_cubit.dart';

class PeriodicCommunicationState extends Equatable {
  final BlocStatus getPeriodicCommunicationStatus;

  PeriodicCommunicationState({
    this.getPeriodicCommunicationStatus = const BlocStatus.initial(),
  });

  PeriodicCommunicationState copyWith({
    BlocStatus? getPeriodicCommunicationStatus,
  }) {
    return PeriodicCommunicationState(
      getPeriodicCommunicationStatus:
          getPeriodicCommunicationStatus ?? this.getPeriodicCommunicationStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getPeriodicCommunicationStatus,
    ];
  }
}
