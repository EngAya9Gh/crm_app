part of 'clients_activities_bloc.dart';



class ClientsActivitiesState extends Equatable {
  final BlocStatus getAllClientsActivitiesStatus;
  final BlocStatus updateClientActivityStatus;
  final List<ClientActivityModel> clientActivities;
  final int currentPage;
  final int totalCount;

  const ClientsActivitiesState({
    this.getAllClientsActivitiesStatus = const BlocStatus.initial(),
    this.updateClientActivityStatus = const BlocStatus.initial(),
    this.clientActivities = const [],
    this.currentPage = 1,
    this.totalCount = 0,

  });

  ClientsActivitiesState copyWith({
    BlocStatus? getAllClientsActivitiesStatus,
    BlocStatus? updateClientActivityStatus,
    List<ClientActivityModel>? clientActivities,
    int? totalCount,
    int? currentPage,

  }) {
    return ClientsActivitiesState(
      getAllClientsActivitiesStatus: getAllClientsActivitiesStatus ?? this.getAllClientsActivitiesStatus,
      updateClientActivityStatus: updateClientActivityStatus ?? this.updateClientActivityStatus,
      clientActivities: clientActivities ?? this.clientActivities,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,

    );
  }

  @override
  List<Object> get props => [getAllClientsActivitiesStatus, updateClientActivityStatus,  clientActivities, currentPage, ];
}