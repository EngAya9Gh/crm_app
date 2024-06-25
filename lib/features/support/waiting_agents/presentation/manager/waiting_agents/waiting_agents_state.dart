part of 'waiting_agents_cubit.dart';

class WaitingAgentsState extends Equatable {
  final BlocStatus getWaitingAgentsStatus;

  const WaitingAgentsState({
    this.getWaitingAgentsStatus = const BlocStatus.initial(),
  });

  WaitingAgentsState copyWith({
    BlocStatus? getWaitingAgentsStatus,
  }) {
    return WaitingAgentsState(
      getWaitingAgentsStatus:
          getWaitingAgentsStatus ?? this.getWaitingAgentsStatus,
    );
  }

  @override
  List<Object> get props => [getWaitingAgentsStatus];
}
