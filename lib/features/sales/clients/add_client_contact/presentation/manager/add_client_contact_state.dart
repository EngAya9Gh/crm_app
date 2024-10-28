part of 'add_client_contact_bloc.dart';

class AddClientContactState extends Equatable {
  final BlocStatus addClientContactStatus;
  final ClientContactModel? contact;
  final ClientModel? selectedClient; // Add this
  final ContactTypeRoleEnum selectedRole; // Add this

  const AddClientContactState({
    this.addClientContactStatus = const BlocStatus.initial(),
    this.contact,
    this.selectedClient,
    this.selectedRole = ContactTypeRoleEnum.employee, // Add this with default
  });

  AddClientContactState copyWith({
    BlocStatus? addClientContactStatus,
    ClientContactModel? contact,
    ClientModel? selectedClient, // Add this
    ContactTypeRoleEnum? selectedRole, // Add this

  }) {
    return AddClientContactState(
      addClientContactStatus: addClientContactStatus ?? this.addClientContactStatus,
      contact: contact ?? this.contact,
      selectedClient: selectedClient ?? this.selectedClient, // Add this
        selectedRole: selectedRole ?? this.selectedRole // Add this

    );
  }

  @override
  List<Object?> get props => [addClientContactStatus, contact, selectedClient, selectedRole];
}