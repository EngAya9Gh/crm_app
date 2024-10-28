part of 'add_client_contact_bloc.dart';

abstract class AddClientContactEvent extends Equatable {
  const AddClientContactEvent();

  @override
  List<Object?> get props => [];
}

class AddClientContactSubmitEvent extends AddClientContactEvent {
  final AddClientContactParams addContactParams;
  final ValueChanged<ClientContactModel>? onSuccess;

  const AddClientContactSubmitEvent(this.addContactParams, {this.onSuccess});

  @override
  List<Object?> get props => [addContactParams];
}
class UpdateClientContactEvent extends AddClientContactEvent {
  final AddClientContactParams addContactParams;
  final ValueChanged<ClientContactModel>? onSuccess;

  const UpdateClientContactEvent(this.addContactParams, {this.onSuccess});

  @override
  List<Object?> get props => [addContactParams];
}

class SelectClientEvent extends AddClientContactEvent {
  final ClientModel client;

  const SelectClientEvent(this.client);

  @override
  List<Object> get props => [client];
}

class UpdateContactRoleEvent extends AddClientContactEvent {
  final ContactTypeRoleEnum role;

  const UpdateContactRoleEvent(this.role);

  @override
  List<Object> get props => [role];
}