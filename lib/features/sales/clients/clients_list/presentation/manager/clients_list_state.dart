part of 'clients_list_bloc.dart';

class ClientsListState extends Equatable {
  final int refreshUi;
  final GetClientMarketingReportParams? getClientMarketingReportParams;
  GetClientsWithFilterParams? getClientsWithFilterParams;
  final GetSimilarClientsListParams? getSimilarClientsParams;
  final ChangeTypeClientParam? changeTypeClientParams;
  final StoreClientCommunicationParam? storeClientCommunicationParams;
  final ChangeClientCommunicationParam? changeClientCommunicationParams;
  final PageState<List<RecommendedClient>> recommendedClientsState;
  final BlocStatus actionClientBlocStatus;
  final BlocStatus<List<SimilarClient>> similarClientsState;
  bool myclient_parm;

  final List<ClientSupportFileModel> clientSupportFilesList;
  final BlocStatus getClientSupportFilesStatus;
  final BlocStatus getAllClientsStatus;
  final BlocStatus crudClientSupportFilesStatus;
  final BlocStatus transferClientStatus;
  final BlocStatus receiveClientStatus;
  final BlocStatus clientMarketingReportStatus;
  final BlocStatus highSimilarClientsState;
  final BlocStatus getLinkClientsStatus;
  final BlocStatus linkSelectedClientsStatus;
  final BlocStatus exportClientsToExcelStatus;
  String? error;
  final int? currentPage;
  final BlocStatus usersSales;

  ClientsListState({
    this.refreshUi = 0,
    this.getAllClientsStatus = const BlocStatus.initial(),
    this.getSimilarClientsParams,
    this.getClientsWithFilterParams,
    this.changeTypeClientParams,
    this.storeClientCommunicationParams,
    this.changeClientCommunicationParams,
    this.recommendedClientsState = const PageState.init(),
    this.similarClientsState = const BlocStatus.initial(),
    this.actionClientBlocStatus = const BlocStatus.initial(),
    this.myclient_parm = false,
    this.clientSupportFilesList = const [],
    this.getClientSupportFilesStatus = const BlocStatus.initial(),
    this.crudClientSupportFilesStatus = const BlocStatus.initial(),
    this.transferClientStatus = const BlocStatus.initial(),
    this.receiveClientStatus = const BlocStatus.initial(),
    this.clientMarketingReportStatus = const BlocStatus.initial(),
    this.getClientMarketingReportParams,
    this.highSimilarClientsState = const BlocStatus.initial(),
    this.getLinkClientsStatus = const BlocStatus.initial(),
    this.linkSelectedClientsStatus = const BlocStatus.initial(),
    this.exportClientsToExcelStatus = const BlocStatus.initial(),
    this.error,
    this.currentPage,
    this.usersSales = const BlocStatus.initial(),
  });

  ClientsListState copyWith({
    int? refreshUi,
    BlocStatus? getAllClientsStatus,
    GetClientsWithFilterParams? getClientsWithFilterParams,
    GetSimilarClientsListParams? getSimilarClientsParams,
    ChangeTypeClientParam? changeTypeClientParams,
    ChangeClientCommunicationParam? changeClientCommunicationParams,
    StoreClientCommunicationParam? storeClientCommunicationParams,
    PageState<List<RecommendedClient>>? recommendedClientsState,
    BlocStatus<List<SimilarClient>>? similarClientsState,
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
    BlocStatus? highSimilarClientsState,
    BlocStatus? getLinkClientsStatus,
    BlocStatus? linkSelectedClientsStatus,
    BlocStatus? exportClientsToExcelStatus,
    String? error,
    int? currentPage,
    BlocStatus? usersSales,
  }) {
    return ClientsListState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      getAllClientsStatus: getAllClientsStatus ?? this.getAllClientsStatus,
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
      highSimilarClientsState:
          highSimilarClientsState ?? this.highSimilarClientsState,
      currentPage: currentPage ?? this.currentPage,
      changeClientCommunicationParams: changeClientCommunicationParams ?? this.changeClientCommunicationParams,
      storeClientCommunicationParams: storeClientCommunicationParams ?? this.storeClientCommunicationParams,
      getLinkClientsStatus: getLinkClientsStatus ?? this.getLinkClientsStatus,
      linkSelectedClientsStatus:
          linkSelectedClientsStatus ?? this.linkSelectedClientsStatus,
      exportClientsToExcelStatus:
          exportClientsToExcelStatus ?? this.exportClientsToExcelStatus,
      usersSales: usersSales ?? this.usersSales,
    );
  }

  @override
  List<Object> get props {
    return [
      refreshUi,
      getAllClientsStatus,
      recommendedClientsState,
      similarClientsState,
      actionClientBlocStatus,
      myclient_parm,
      clientSupportFilesList,
      getClientSupportFilesStatus,
      crudClientSupportFilesStatus,
      transferClientStatus,
      receiveClientStatus,
      clientMarketingReportStatus,
      highSimilarClientsState,
      getLinkClientsStatus,
      exportClientsToExcelStatus,
      exportClientsToExcelStatus,
      usersSales
    ];
  }
}
