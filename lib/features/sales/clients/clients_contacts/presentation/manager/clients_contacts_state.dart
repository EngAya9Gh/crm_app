part of 'clients_contacts_bloc.dart';

class ClientsContactsState extends Equatable {
  final BlocStatus getAllClientsContactsStatus;
  final List<ClientContactModel> clientContacts;
  final int totalCount;
  final int currentPage;
  final ContactTypeRoleEnum selectedRole; // Add this

  const ClientsContactsState({
    this.getAllClientsContactsStatus = const BlocStatus.initial(),
    this.clientContacts = const [],
    this.totalCount = 0,
    this.currentPage = 1,
    this.selectedRole = ContactTypeRoleEnum.employee, // Add this with default

  });

  ClientsContactsState copyWith({
    BlocStatus? getAllClientsContactsStatus,
    List<ClientContactModel>? clientContacts,
    int? totalCount,
    int? currentPage,
    ContactTypeRoleEnum? selectedRole, // Add this

  }) {
    return ClientsContactsState(
      getAllClientsContactsStatus: getAllClientsContactsStatus ?? this.getAllClientsContactsStatus,
      clientContacts: clientContacts ?? this.clientContacts,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
        selectedRole: selectedRole ?? this.selectedRole // Add this

    );
  }

  @override
  List<Object> get props => [getAllClientsContactsStatus, clientContacts, totalCount, currentPage, selectedRole];
}