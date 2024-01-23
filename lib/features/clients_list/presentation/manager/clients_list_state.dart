part of 'clients_list_bloc.dart';

class ClientsListState {
  ClientsListState({
    PagingController<int, ClientModel>? clientsListController,
    this.getClientsWithFilterParams,
    this.recommendedClientsState = const PageState.init(),
    this.similarClientsState = const PageState.init(),
    this.actionClientBlocStatus = const BlocStatus.initial(),
      this.myclient_parm=false,

  }) : clientsListController = clientsListController ?? PagingController(firstPageKey: 1, invisibleItemsThreshold: 10);

  final PagingController<int, ClientModel> clientsListController;
  final GetClientsWithFilterParams? getClientsWithFilterParams;
  final PageState<List<RecommendedClient>> recommendedClientsState;
  final PageState<List<SimilarClient>> similarClientsState;
  final BlocStatus actionClientBlocStatus;
  bool myclient_parm ;

  ClientsListState copyWith({
    PagingController<int, ClientModel>? clientsListController,
    GetClientsWithFilterParams? getClientsWithFilterParams,
    PageState<List<RecommendedClient>>? recommendedClientsState,
    PageState<List<SimilarClient>>? similarClientsState,
    final BlocStatus? actionClientBlocStatus,
    bool restFilter = false,
    bool myclient=false
  }) {
    return ClientsListState(

      clientsListController: clientsListController ?? this.clientsListController,
      getClientsWithFilterParams: restFilter ? null : getClientsWithFilterParams ?? this.getClientsWithFilterParams,
      recommendedClientsState: recommendedClientsState ?? this.recommendedClientsState,
        similarClientsState: similarClientsState ?? this.similarClientsState,
      actionClientBlocStatus: actionClientBlocStatus ??   this.actionClientBlocStatus,
      myclient_parm: myclient
    );
  }
}
