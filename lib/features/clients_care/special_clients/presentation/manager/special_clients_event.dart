part of 'special_clients_bloc.dart';

abstract class SpecialClientsEvent extends Equatable {
  const SpecialClientsEvent();
}

class GetCommunicationListEvent extends SpecialClientsEvent {
  final String fkCountry;
  final String query;

  GetCommunicationListEvent(
    this.fkCountry, {
    required this.query,
  });

  @override
  List<Object?> get props => [fkCountry];
}

class SearchEvent extends SpecialClientsEvent {
  final String query;

  SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class OnChangeRegionEvent extends SpecialClientsEvent {
  final String? selectedRegionId;
  final String fkCountry;
  final String query;

  OnChangeRegionEvent(this.selectedRegionId, this.fkCountry, this.query);

  @override
  List<Object?> get props => [selectedRegionId, fkCountry, query];
}
