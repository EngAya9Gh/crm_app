part of 'communication_list_bloc.dart';

abstract class CommunicationListEvent extends Equatable {
  const CommunicationListEvent();
}

class GetCommunicationListEvent extends CommunicationListEvent {
  final String fkCountry;
  final String query;

  GetCommunicationListEvent(
    this.fkCountry, {
    required this.query,
  });

  @override
  List<Object?> get props => [fkCountry];
}

class SearchEvent extends CommunicationListEvent {
  final String query;

  SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class OnChangeRegionEvent extends CommunicationListEvent {
  final String? selectedRegionId;
  final String fkCountry;
  final String query;

  OnChangeRegionEvent(this.selectedRegionId, this.fkCountry, this.query);

  @override
  List<Object?> get props => [selectedRegionId, fkCountry, query];
}
