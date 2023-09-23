part of 'clients_list_bloc.dart';

abstract class ClientsListEvent extends Equatable {
  const ClientsListEvent();
}

class GetAllClientsListEvent extends ClientsListEvent {
  final String fkCountry;
  final int page;
  final int perPage;

  GetAllClientsListEvent({
    required this.fkCountry,
    required this.page,
    required this.perPage,
  });

  @override
  List<Object?> get props => [fkCountry,page,perPage];
}

class GetClientsListByRegionEvent extends ClientsListEvent {
  final String fkRegion;

  GetClientsListByRegionEvent(this.fkRegion,);

  @override
  List<Object?> get props => [fkRegion];
}

class GetClientsListByUserEvent extends ClientsListEvent {
  final String fkUser;

  GetClientsListByUserEvent(this.fkUser);

  @override
  List<Object?> get props => [fkUser];
}
