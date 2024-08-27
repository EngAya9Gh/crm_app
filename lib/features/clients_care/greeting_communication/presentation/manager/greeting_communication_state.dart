part of 'greeting_communication_cubit.dart';

class GreetingCommunicationState extends Equatable {
  final BlocStatus getGreetingCommunicationStatus;

  GreetingCommunicationState({
    this.getGreetingCommunicationStatus = const BlocStatus.initial(),
  });

  GreetingCommunicationState copyWith({
    BlocStatus? getGreetingCommunicationStatus,
  }) {
    return GreetingCommunicationState(
      getGreetingCommunicationStatus:
          getGreetingCommunicationStatus ?? this.getGreetingCommunicationStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getGreetingCommunicationStatus,
    ];
  }
}
