part of 'agents_distributors_actions_cubit.dart';

@immutable
abstract class AgentsDistributorsActionsState {}

class AgentsDistributorsActionsInitial extends AgentsDistributorsActionsState {}

class AgentsDistributorsActionsLoading extends AgentsDistributorsActionsState {}

class AgentsDistributorsActionsSuccess extends AgentsDistributorsActionsState {}

class AgentsDistributorsActionsFailure extends AgentsDistributorsActionsState {
  final String error;

  AgentsDistributorsActionsFailure(this.error);
}

class AgentsDistributorsActionsTypeChanged
    extends AgentsDistributorsActionsState {}

// city
class AgentsDistributorsActionsCityChanged
    extends AgentsDistributorsActionsState {}
