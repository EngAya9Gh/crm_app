part of 'communication_list_bloc.dart';

abstract class CommunicationListEvent extends Equatable {
  const CommunicationListEvent();
}

class GetCommunicationListEvent extends CommunicationListEvent {
  final String fkCountry;

  GetCommunicationListEvent(this.fkCountry);

  @override
  List<Object?> get props => [fkCountry];
}
