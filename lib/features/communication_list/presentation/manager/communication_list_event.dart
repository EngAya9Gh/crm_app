part of 'communication_list_bloc.dart';

abstract class CommunicationListEvent extends Equatable {
  const CommunicationListEvent();
}

class GetCommunicationListEvent extends CommunicationListEvent {
  final String fkCountry;
  final String query;
  final String? userId;

  GetCommunicationListEvent(
    this.fkCountry, {
    this.userId,
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
