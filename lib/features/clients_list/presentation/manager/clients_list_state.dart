
part of 'clients_list_bloc.dart';

class ClientsListState {
  const ClientsListState({
    this.clientsListState = const PageState.init(),
  });

  final PageState<List<ClientModel>> clientsListState;

  // @override
  // List<Object?> get props => [clientsListState];

  ClientsListState copyWith({
    PageState<List<ClientModel>>? clientsListState,
  }) {
    return ClientsListState(
      clientsListState: clientsListState ?? this.clientsListState,
    );
  }
}
