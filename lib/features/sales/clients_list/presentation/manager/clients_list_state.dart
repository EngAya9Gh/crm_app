part of 'clients_list_bloc.dart';

class ClientsListState {
  ClientsListState({
    this.refreshUi = 0,
    PagingController<int, ClientModel>? clientsListController,
    this.getSimilarClientsParams,
    this.getClientsWithFilterParams,
    this.changeTypeClientParams,
    this.recommendedClientsState = const PageState.init(),
    this.similarClientsState = const PageState.init(),
    this.actionClientBlocStatus = const BlocStatus.initial(),
    this.myclient_parm = false,
    this.clientSupportFilesList = const [],
    this.getClientSupportFilesStatus = const BlocStatus.initial(),
    this.crudClientSupportFilesStatus = const BlocStatus.initial(),
    this.transferClientStatus = const BlocStatus.initial(),
    this.receiveClientStatus = const BlocStatus.initial(),
    this.clientMarketingReportStatus = const BlocStatus.initial(),
    this.getClientMarketingReportParams,
  }) : clientsListController = clientsListController ??
            PagingController(firstPageKey: 1, invisibleItemsThreshold: 10);

  final int refreshUi;
  final PagingController<int, ClientModel> clientsListController;
  final GetClientsWithFilterParams? getClientsWithFilterParams;
  final GetSimilarClientsListParams? getSimilarClientsParams;
  final ChangeTypeClientParam? changeTypeClientParams;
  final PageState<List<RecommendedClient>> recommendedClientsState;
  final PageState<List<SimilarClient>> similarClientsState;
  final BlocStatus actionClientBlocStatus;
  bool myclient_parm;

  final List<ClientSupportFileModel> clientSupportFilesList;
  final BlocStatus getClientSupportFilesStatus;
  final BlocStatus crudClientSupportFilesStatus;
  final BlocStatus transferClientStatus;
  final BlocStatus receiveClientStatus;
  final BlocStatus clientMarketingReportStatus;
  final GetClientMarketingReportParams? getClientMarketingReportParams;

  ClientsListState copyWith({
    int? refreshUi,
    PagingController<int, ClientModel>? clientsListController,
    GetClientsWithFilterParams? getClientsWithFilterParams,
    GetSimilarClientsListParams? getSimilarClientsParams,
    ChangeTypeClientParam? changeTypeClientParams,
    PageState<List<RecommendedClient>>? recommendedClientsState,
    PageState<List<SimilarClient>>? similarClientsState,
    final BlocStatus? actionClientBlocStatus,
    bool restFilter = false,
    bool myclient = false,
    List<ClientSupportFileModel>? clientSupportFilesList,
    BlocStatus? clientSupportFilesBlocStatus,
    BlocStatus? crudClientSupportFilesStatus,
    BlocStatus? transferClientStatus,
    BlocStatus? receiveClientStatus,
    BlocStatus? clientMarketingReportStatus,
    GetClientMarketingReportParams? getClientMarketingReportParams,
  }) {
    return ClientsListState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      clientsListController:
          clientsListController ?? this.clientsListController,
      getClientsWithFilterParams: restFilter
          ? null
          : getClientsWithFilterParams ?? this.getClientsWithFilterParams,
      getSimilarClientsParams: restFilter
          ? null
          : getSimilarClientsParams ?? this.getSimilarClientsParams,
      changeTypeClientParams:
          changeTypeClientParams ?? this.changeTypeClientParams,
      recommendedClientsState:
          recommendedClientsState ?? this.recommendedClientsState,
      similarClientsState: similarClientsState ?? this.similarClientsState,
      actionClientBlocStatus:
          actionClientBlocStatus ?? this.actionClientBlocStatus,
      myclient_parm: myclient,
      clientSupportFilesList:
          clientSupportFilesList ?? this.clientSupportFilesList,
      getClientSupportFilesStatus:
          clientSupportFilesBlocStatus ?? this.getClientSupportFilesStatus,
      crudClientSupportFilesStatus:
          crudClientSupportFilesStatus ?? this.crudClientSupportFilesStatus,
      transferClientStatus: transferClientStatus ?? this.transferClientStatus,
      receiveClientStatus: receiveClientStatus ?? this.receiveClientStatus,
      clientMarketingReportStatus:
          clientMarketingReportStatus ?? this.clientMarketingReportStatus,
      getClientMarketingReportParams:
          getClientMarketingReportParams ?? this.getClientMarketingReportParams,
    );
  }
}
