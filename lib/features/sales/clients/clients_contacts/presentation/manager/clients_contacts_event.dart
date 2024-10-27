part of 'clients_contacts_bloc.dart';

abstract class ClientsContactsEvent extends Equatable {
  const ClientsContactsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllClientsContactsEvent extends ClientsContactsEvent {
  final int page;
  final String? filter;
  final int? limit;

  const GetAllClientsContactsEvent({
    required this.page,
    this.filter,
    this.limit,
  });

  @override
  List<Object?> get props => [page, filter, limit];
}