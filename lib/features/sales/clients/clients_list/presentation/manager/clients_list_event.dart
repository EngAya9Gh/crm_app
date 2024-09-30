part of 'clients_list_bloc.dart';

abstract class ClientsListEvent extends Equatable {
  const ClientsListEvent();

  @override
  List<Object?> get props => [];
}

class GetAllClientsListEvent extends ClientsListEvent {
  final String? download;
  final bool isNewFilter;
  final bool isInfiniteScroll;
  final int pageWeb;
  final Function? onSuccess;

  const GetAllClientsListEvent({
    this.download,
    this.isNewFilter = true,
    this.pageWeb = 1,
    this.isInfiniteScroll = false,
    this.onSuccess,
  });

  @override
  List<Object?> get props {
    return [
      download,
      isNewFilter,
      pageWeb,
      isInfiniteScroll,
      onSuccess,
    ];
  }
}

class ExportClientsToExcelEvent extends ClientsListEvent {
  final ValueChanged<List<int>>? onSuccess;

  ExportClientsToExcelEvent({this.onSuccess});

  @override
  List<Object?> get props => [];
}

class GetSimilarClientsListEvent extends ClientsListEvent {
  GetSimilarClientsListParams getClientsWithFilterParams;
  final ValueChanged<List<SimilarClient>>? onSuccess;

  GetSimilarClientsListEvent(this.getClientsWithFilterParams, {this.onSuccess});

  @override
  List<Object?> get props => [getClientsWithFilterParams];
}

class GetRecommendedClientsEvent extends ClientsListEvent {
  final ValueChanged<List<RecommendedClient>>? onSuccess;

  GetRecommendedClientsEvent({this.onSuccess});

  @override
  List<Object?> get props => [];
}

class AddClientEvent extends ClientsListEvent {
  final AddClientParams addClientParams;

  final ValueChanged<ClientModel>? onSuccess;

  AddClientEvent(this.addClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [addClientParams];
}

class EditClientEvent extends ClientsListEvent {
  final EditClientParams editClientParams;
  final ValueChanged<ClientModel>? onSuccess;

  EditClientEvent(this.editClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [editClientParams];
}

class ChangeTypeClientEvent extends ClientsListEvent {
  final ChangeTypeClientParam changeTypeClientParams;
  final ValueChanged<ClientModel>? onSuccess;

  ChangeTypeClientEvent(this.changeTypeClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [changeTypeClientParams];
}

class ApproveRejectClientEvent extends ClientsListEvent {
  final ApproveRejectClientPararm approveRejectClientParams;
  final ValueChanged<ClientModel>? onSuccess;

  ApproveRejectClientEvent(this.approveRejectClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [approveRejectClientParams];
}

class GetClientSupportFilesEvent extends ClientsListEvent {
  final GetClientSupportFilesParams getClientSupportFilesParams;
  final ValueChanged<List<ClientSupportFileModel>>? onSuccess;

  GetClientSupportFilesEvent(this.getClientSupportFilesParams,
      {this.onSuccess});

  @override
  List<Object?> get props => [getClientSupportFilesParams];
}

class CrudClientSupportFilesEvent extends ClientsListEvent {
  final CrudClientSupportFilesParams crudClientSupportFilesParams;
  final ValueChanged<List<ClientSupportFileModel>>? onSuccess;

  CrudClientSupportFilesEvent(this.crudClientSupportFilesParams,
      {this.onSuccess});

  @override
  List<Object?> get props => [crudClientSupportFilesParams];
}

class TransferClientEvent extends ClientsListEvent {
  final TransferClientParams transferClientParams;
  final ValueChanged<ClientModel>? onSuccess;

  TransferClientEvent(this.transferClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [transferClientParams];
}

class ReceiveClientEvent extends ClientsListEvent {
  final ReceiveClientParams receiveClientParams;
  final ValueChanged<ClientModel>? onSuccess;

  ReceiveClientEvent(this.receiveClientParams, {this.onSuccess});

  @override
  List<Object?> get props => [receiveClientParams];
}

class GetClientMarketingReportEvent extends ClientsListEvent {
  final GetClientMarketingReportParams? params;

  GetClientMarketingReportEvent({this.params});

  @override
  List<Object?> get props => [params];
}

class SearchClientMarketingReportEvent extends ClientsListEvent {
  const SearchClientMarketingReportEvent();

  @override
  List<Object?> get props => [];
}

class GetHighSimilarClientsListEvent extends ClientsListEvent {
  final GetHighSimilarClientsParams getHighSimilarClientsParams;
  final ValueChanged<List<SimilarClient>>? onSuccess;

  const GetHighSimilarClientsListEvent(
    this.getHighSimilarClientsParams, {
    this.onSuccess,
  });

  @override
  List<Object?> get props => [getHighSimilarClientsParams];
}

class FetchPaginatedClientsEvent extends ClientsListEvent {
  final int page;
  final String fkCountry;

  const FetchPaginatedClientsEvent(
      {required this.page, required this.fkCountry});

  @override
  List<Object?> get props => [page, fkCountry];
}
