part of 'special_clients_bloc.dart';

abstract class SpecialClientsEvent extends Equatable {
  const SpecialClientsEvent();
}

class GetSpecialClientsEvent extends SpecialClientsEvent {
  final int? page;
  GetSpecialClientsEvent({this.page});

  @override
  List<Object?> get props => [];
}

class SearchEvent extends SpecialClientsEvent {
  SearchEvent();

  @override
  List<Object?> get props => [];
}
