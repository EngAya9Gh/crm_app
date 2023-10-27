
part of 'clients_list_bloc.dart';

class ClientsListState {
   ClientsListState({
    this.clientsListState = const PageState.init(),
    this.currentPage = 1,
  });

  final PageState<List<ClientModel>> clientsListState;
   int currentPage;

  ClientsListState copyWith({
    PageState<List<ClientModel>>? clientsListState,
    int? currentPage,
  }) {
    return ClientsListState(
      clientsListState: clientsListState ?? this.clientsListState,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
