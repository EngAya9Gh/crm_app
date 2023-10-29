part of 'clients_list_bloc.dart';

class ClientsListState {
  ClientsListState({
    PagingController<int, ClientModel>? clientsListController,
    this.getClientsWithFilterParams,
  }) : clientsListController = clientsListController ?? PagingController(firstPageKey: 1,invisibleItemsThreshold: 10);

  final PagingController<int, ClientModel> clientsListController;
  final GetClientsWithFilterParams? getClientsWithFilterParams;

  ClientsListState copyWith({
    PagingController<int, ClientModel>? clientsListController,
    GetClientsWithFilterParams? getClientsWithFilterParams,
    bool restFilter = false,
  }) {
    return ClientsListState(
      clientsListController: clientsListController ?? this.clientsListController,
      getClientsWithFilterParams: restFilter ? null : getClientsWithFilterParams ?? this.getClientsWithFilterParams,
    );
  }
}
