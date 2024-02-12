part of 'clients_list_bloc.dart';

class ClientsListState {
  ClientsListState({
    PagingController<int, ClientsListResponse>? clientsListController,
    this.getClientsWithFilterParams,
    this.recommendedClientsState = const PageState.init(),
    this.actionClientBlocStatus = const BlocStatus.initial(),
  }) : clientsListController = clientsListController ?? PagingController(firstPageKey: 1, invisibleItemsThreshold: 10);

  final PagingController<int, ClientsListResponse> clientsListController;
  final GetClientsWithFilterParams? getClientsWithFilterParams;
  final PageState<List<RecommendedClient>> recommendedClientsState;
  final BlocStatus actionClientBlocStatus;

  ClientsListState copyWith({
    PagingController<int, ClientsListResponse>? clientsListController,
    GetClientsWithFilterParams? getClientsWithFilterParams,
    PageState<List<RecommendedClient>>? recommendedClientsState,
    final BlocStatus? actionClientBlocStatus,
    bool restFilter = false,
  }) {
    return ClientsListState(
      clientsListController: clientsListController ?? this.clientsListController,
      getClientsWithFilterParams: restFilter ? null : getClientsWithFilterParams ?? this.getClientsWithFilterParams,
      recommendedClientsState: recommendedClientsState ?? this.recommendedClientsState,
      actionClientBlocStatus: actionClientBlocStatus ?? this.actionClientBlocStatus,
    );
  }
}
