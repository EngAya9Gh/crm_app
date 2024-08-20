part of 'greeting_communication_cubit.dart';

class GreetingCommunicationState extends Equatable {
  final BlocStatus getGreetingCommunicationStatus;
  final BlocStatus filterGreetingCommunicationStatus;

  GreetingCommunicationState({
    this.getGreetingCommunicationStatus = const BlocStatus.initial(),
    this.filterGreetingCommunicationStatus = const BlocStatus.initial(),
  });

  GreetingCommunicationState copyWith({
    BlocStatus? getGreetingCommunicationStatus,
    BlocStatus? filterGreetingCommunicationStatus,
  }) {
    return GreetingCommunicationState(
      getGreetingCommunicationStatus:
          getGreetingCommunicationStatus ?? this.getGreetingCommunicationStatus,
      filterGreetingCommunicationStatus: filterGreetingCommunicationStatus ??
          this.filterGreetingCommunicationStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getGreetingCommunicationStatus,
      filterGreetingCommunicationStatus,
    ];
  }
}
