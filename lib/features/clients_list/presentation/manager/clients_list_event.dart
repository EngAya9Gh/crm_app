part of 'clients_list_bloc.dart';

abstract class ClientsListEvent extends Equatable {
  const ClientsListEvent();
}

class GetAllClientsListEvent extends ClientsListEvent {
  final String fkCountry;
  final String? userPrivilegeId;
  final String? regionPrivilegeId;
  final int page;

  GetAllClientsListEvent({
    required this.fkCountry,
    required this.page,
    this.regionPrivilegeId,
    this.userPrivilegeId,
  });

  @override
  List<Object?> get props => [fkCountry, page];
}

class GetSimilarClientsListEvent extends ClientsListEvent {
  GetSimilarClientsListParams getClientsWithFilterParams;
  final ValueChanged<List<SimilarClient>>? onSuccess;

  GetSimilarClientsListEvent(this.getClientsWithFilterParams, {this.onSuccess});

  @override
  List<Object?> get props => [getClientsWithFilterParams];
}

class UpdateGetClientsParamsEvent extends ClientsListEvent {
  final GetClientsWithFilterParams getClientsWithFilterParams;
  final bool resetFilter;

  UpdateGetClientsParamsEvent({
    required this.getClientsWithFilterParams,
    this.resetFilter = false,
  });

  @override
  List<Object?> get props => [getClientsWithFilterParams, resetFilter];
}

class SearchEvent extends ClientsListEvent {
  final String query;

  const SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class SwitchEvent extends ClientsListEvent {
  bool mycl;

  SwitchEvent({required this.mycl});

  @override
  List<Object?> get props => [mycl];
}

class ResetClientList extends ClientsListEvent {
  @override
  List<Object?> get props => [];
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
