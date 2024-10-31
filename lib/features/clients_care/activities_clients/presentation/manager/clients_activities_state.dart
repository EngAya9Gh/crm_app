part of 'clients_activities_bloc.dart';



class ClientsActivitiesState extends Equatable {
  final BlocStatus getAllClientsActivitiesStatus;
  final List<ClientActivityModel> clientActivities;
  final int totalCount;
  final int currentPage;

  const ClientsActivitiesState({
    this.getAllClientsActivitiesStatus = const BlocStatus.initial(),
    this.clientActivities = const [],
    this.totalCount = 0,
    this.currentPage = 1,

  });

  ClientsActivitiesState copyWith({
    BlocStatus? getAllClientsActivitiesStatus,
    List<ClientActivityModel>? clientActivities,
    int? totalCount,
    int? currentPage,

  }) {
    return ClientsActivitiesState(
      getAllClientsActivitiesStatus: getAllClientsActivitiesStatus ?? this.getAllClientsActivitiesStatus,
      clientActivities: clientActivities ?? this.clientActivities,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,

    );
  }

  @override
  List<Object> get props => [getAllClientsActivitiesStatus, clientActivities, totalCount, currentPage, ];
}