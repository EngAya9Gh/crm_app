part of 'clients_contacts_bloc.dart';

class ClientsContactsState extends Equatable {
  final BlocStatus getAllClientsContactsStatus;
  final List<ClientContactModel> clientContacts;
  final int totalCount;
  final int currentPage;

  const ClientsContactsState({
    this.getAllClientsContactsStatus = const BlocStatus.initial(),
    this.clientContacts = const [],
    this.totalCount = 0,
    this.currentPage = 1,
  });

  ClientsContactsState copyWith({
    BlocStatus? getAllClientsContactsStatus,
    List<ClientContactModel>? clientContacts,
    int? totalCount,
    int? currentPage,
  }) {
    return ClientsContactsState(
      getAllClientsContactsStatus: getAllClientsContactsStatus ?? this.getAllClientsContactsStatus,
      clientContacts: clientContacts ?? this.clientContacts,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [getAllClientsContactsStatus, clientContacts, totalCount, currentPage];
}