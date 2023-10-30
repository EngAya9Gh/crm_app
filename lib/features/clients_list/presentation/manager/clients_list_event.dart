part of 'clients_list_bloc.dart';

abstract class ClientsListEvent extends Equatable {
  const ClientsListEvent();
}

class GetAllClientsListEvent extends ClientsListEvent {
  final String fkCountry;
  final int page;

  GetAllClientsListEvent({
    required this.fkCountry,
    required this.page,
  });

  @override
  List<Object?> get props => [fkCountry, page];
}

class UpdateGetClientsParamsEvent extends ClientsListEvent {
  final GetClientsWithFilterParams getClientsWithFilterParams;
  final bool resetFilter;

  UpdateGetClientsParamsEvent({
    required this.getClientsWithFilterParams,
    this.resetFilter = false,
  });

  @override
  List<Object?> get props => [getClientsWithFilterParams, resetFilter];
}

class SearchEvent extends ClientsListEvent {
  final String query;

  const SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class ResetClientList extends ClientsListEvent {
  @override
  List<Object?> get props => [];
}

class GetRecommendedClientsEvent extends ClientsListEvent {
  final ValueChanged<List<RecommendedClient>>? onSuccess;

  GetRecommendedClientsEvent({this.onSuccess});
  @override
  List<Object?> get props => [];
}
