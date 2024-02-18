part of 'manage_agents_and_distributors_cubit.dart';

class ManageAgentsAndDistributorsState extends Equatable {
  final StateStatus status;
  final List<AgentDistributorModel> agentsAndDistributorsList;
  final String? error;

  ManageAgentsAndDistributorsState({
    this.status = StateStatus.initial,
    this.agentsAndDistributorsList = const [],
    this.error,
  });

  ManageAgentsAndDistributorsState copyWith({
    StateStatus? status,
    List<AgentDistributorModel>? agentsAndDistributorsList,
    String? error,
  }) {
    return ManageAgentsAndDistributorsState(
      status: status ?? this.status,
      agentsAndDistributorsList:
          agentsAndDistributorsList ?? this.agentsAndDistributorsList,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, agentsAndDistributorsList, error];
}
