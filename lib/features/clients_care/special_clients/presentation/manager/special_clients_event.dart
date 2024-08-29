part of 'special_clients_bloc.dart';

abstract class SpecialClientsEvent extends Equatable {
  const SpecialClientsEvent();
}

class GetSpecialClientsEvent extends SpecialClientsEvent {
  GetSpecialClientsEvent();

  @override
  List<Object?> get props => [];
}

class SearchEvent extends SpecialClientsEvent {
  SearchEvent();

  @override
  List<Object?> get props => [];
}
