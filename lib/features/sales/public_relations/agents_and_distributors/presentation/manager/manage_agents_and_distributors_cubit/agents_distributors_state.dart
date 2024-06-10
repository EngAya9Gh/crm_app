part of 'agents_distributors_cubit.dart';

class AgentsDistributorsState extends Equatable {
  final StateStatus status;
  final List<AgentDistributorModel> agentsAndDistributorsList;
  final String? error;
  final BlocStatus changeStateAgent;

  AgentsDistributorsState({
    this.status = StateStatus.initial,
    this.agentsAndDistributorsList = const [],
    this.error,
    this.changeStateAgent = const BlocStatus.initial(),
  });

  AgentsDistributorsState copyWith({
    StateStatus? status,
    List<AgentDistributorModel>? agentsAndDistributorsList,
    String? error,
    BlocStatus? changeStateAgent,
  }) {
    return AgentsDistributorsState(
      status: status ?? this.status,
      agentsAndDistributorsList:
          agentsAndDistributorsList ?? this.agentsAndDistributorsList,
      error: error ?? this.error,
      changeStateAgent: changeStateAgent ?? this.changeStateAgent,
    );
  }

  @override
  List<Object?> get props => [
        status,
        agentsAndDistributorsList,
        error,
        changeStateAgent,
      ];
}
