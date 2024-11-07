part of 'client_activities_bloc.dart';

abstract class ClientActivitiesEvent extends Equatable {
  const ClientActivitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllClientActivitiesEvent extends ClientActivitiesEvent {
  final int page;
  final String clientId;
  final String? filter;
  final String? from;
  final String? to;
  final String? priority;
  final String? fk_user;
  final String? state;

  const GetAllClientActivitiesEvent({
    required this.page,
    required this.clientId,
    this.filter,
    this.fk_user,
    this.priority,
    this.to,
    this.from,
    this.state,
  });

  @override
  List<Object?> get props => [page,clientId, filter, fk_user,  priority, to, from, state];
}
