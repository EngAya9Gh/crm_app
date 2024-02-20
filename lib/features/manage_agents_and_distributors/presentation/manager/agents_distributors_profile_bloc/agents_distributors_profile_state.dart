part of 'agents_distributors_profile_bloc.dart';

class AgentsDistributorsProfileState extends Equatable {
  final List<ClientModel> agentClientsList;
  final StateStatus status;
  final String? error;

  AgentsDistributorsProfileState({
    this.agentClientsList = const [],
    this.status = StateStatus.initial,
    this.error,
  });

  AgentsDistributorsProfileState copyWith({
    List<ClientModel>? agentClientsList,
    StateStatus? status,
    String? error,
  }) {
    return AgentsDistributorsProfileState(
      agentClientsList: agentClientsList ?? this.agentClientsList,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        agentClientsList,
        status,
        error,
      ];
}
