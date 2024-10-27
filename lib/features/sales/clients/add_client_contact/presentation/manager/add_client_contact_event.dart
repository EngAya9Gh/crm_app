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