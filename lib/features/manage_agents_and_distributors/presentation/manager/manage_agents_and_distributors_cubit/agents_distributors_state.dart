part of 'agents_distributors_cubit.dart';

class AgentsDistributorsState extends Equatable {
  final StateStatus status;
  final List<AgentDistributorModel> agentsAndDistributorsList;
  final String? error;

  AgentsDistributorsState({
    this.status = StateStatus.initial,
    this.agentsAndDistributorsList = const [],
    this.error,
  });

  AgentsDistributorsState copyWith({
    StateStatus? status,
    List<AgentDistributorModel>? agentsAndDistributorsList,
    String? error,
  }) {
    return AgentsDistributorsState(
      status: status ?? this.status,
      agentsAndDistributorsList:
          agentsAndDistributorsList ?? this.agentsAndDistributorsList,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, agentsAndDistributorsList, error];
}
