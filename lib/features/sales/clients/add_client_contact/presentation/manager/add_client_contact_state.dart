part of 'add_client_contact_bloc.dart';

class AddClientContactState extends Equatable {
  final BlocStatus addClientContactStatus;
  final ClientContactModel? contact;

  const AddClientContactState({
    this.addClientContactStatus = const BlocStatus.initial(),
    this.contact,
  });

  AddClientContactState copyWith({
    BlocStatus? addClientContactStatus,
    ClientContactModel? contact,
  }) {
    return AddClientContactState(
      addClientContactStatus: addClientContactStatus ?? this.addClientContactStatus,
      contact: contact ?? this.contact,
    );
  }

  @override
  List<Object?> get props => [addClientContactStatus, contact];
}