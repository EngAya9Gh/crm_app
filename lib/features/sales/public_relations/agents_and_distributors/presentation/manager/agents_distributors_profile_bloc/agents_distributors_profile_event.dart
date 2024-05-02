part of 'agents_distributors_profile_bloc.dart';

@immutable
abstract class AgentsDistributorsProfileEvent {}

class GetAgentClientListEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetAgentClientListParams getAgentClientListParams;
  final String query;

  GetAgentClientListEvent({
    required this.query,
    required this.getAgentClientListParams,
  });

  @override
  List<Object?> get props => [query, getAgentClientListParams];
}

class GetAgentEvent extends AgentsDistributorsProfileEvent with EquatableMixin {
  final GetAgentParams getAgentParams;
  final String query;

  GetAgentEvent({
    required this.query,
    required this.getAgentParams,
  });

  @override
  List<Object?> get props => [query, getAgentParams];
}

class SearchClientEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final String query;

  SearchClientEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class GetAgentInvoiceListEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetAgentInvoiceListParams getAgentInvoiceListParams;
  final String query;

  GetAgentInvoiceListEvent({
    required this.query,
    required this.getAgentInvoiceListParams,
  });

  @override
  List<Object?> get props => [query, getAgentInvoiceListParams];
}

class SearchInvoiceEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final String query;

  SearchInvoiceEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class GetInvoiceByIdEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetInvoiceByIdParams getInvoiceByIdParams;
  final ValueChanged<InvoiceModel>? onSuccess;

  GetInvoiceByIdEvent(this.getInvoiceByIdParams, {this.onSuccess});

  @override
  List<Object?> get props => [getInvoiceByIdParams];
}

class GetAgentCommentListEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetAgentCommentListParams getAgentCommentListParams;

  GetAgentCommentListEvent({
    required this.getAgentCommentListParams,
  });

  @override
  List<Object?> get props => [];
}

class AddAgentCommentEvent extends AgentsDistributorsProfileEvent {
  final AddAgentCommentParams addAgentCommentParams;
  final VoidCallback? onSuccess;

  AddAgentCommentEvent(this.addAgentCommentParams, {this.onSuccess});
}

class DoneAgentEvent extends AgentsDistributorsProfileEvent {
  final DoneTrainingParams DoneParams;
  final ValueChanged<AgentDistributorModel>? onSuccess;

  DoneAgentEvent(this.DoneParams, {this.onSuccess});
}

class GetAgentDatesListEvent extends AgentsDistributorsProfileEvent
    with EquatableMixin {
  final GetAgentDatesListParams getAgentDatesListParams;

  GetAgentDatesListEvent({
    required this.getAgentDatesListParams,
  });

  @override
  List<Object?> get props => [getAgentDatesListParams];
}

class AddAgentDateEvent extends AgentsDistributorsProfileEvent {
  final DateInstallationClient addAgentDateParams;
  final VoidCallback? onSuccess;

  AddAgentDateEvent({
    required this.addAgentDateParams,
    this.onSuccess,
  });
}

// enable end date
class EnableEndDateEvent extends AgentsDistributorsProfileEvent {}
