part of 'clients_activities_bloc.dart';

abstract class ClientsActivitiesEvent extends Equatable {
  const ClientsActivitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllClientsActivitiesEvent extends ClientsActivitiesEvent {
  final int page;
  final String? filter;
  final String? contactType;
  final int? limit;

  const GetAllClientsActivitiesEvent({
    required this.page,
    this.filter,
    this.contactType,
    this.limit,
  });

  @override
  List<Object?> get props => [page, filter, limit, contactType];
}
