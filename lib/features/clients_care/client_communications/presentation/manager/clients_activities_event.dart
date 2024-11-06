part of 'clients_activities_bloc.dart';

abstract class ClientsActivitiesEvent extends Equatable {
  const ClientsActivitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllClientsActivitiesEvent extends ClientsActivitiesEvent {
  final int page;
  final String? filter;
  final String? from;
  final String? to;
  final String? priority;
  final String? fk_user;
  final String? state;

  const GetAllClientsActivitiesEvent({
    required this.page,
    this.filter,
    this.fk_user,
    this.priority,
    this.to,
    this.from,
    this.state,
  });

  @override
  List<Object?> get props => [page, filter, fk_user,  priority, to, from, state];
}

class UpdateActivityEvent extends ClientsActivitiesEvent {
  final int activityId;
  final String endDate;
  final String description;
  final String state;
  final VoidCallback? onSuccess;

  const UpdateActivityEvent({
    required this.activityId,
    required this.endDate,
    required this.description,
    required this.state,
    this.onSuccess
  });

  @override
  List<Object?> get props => [endDate, activityId, description, state, onSuccess];
}


