part of 'client_activities_bloc.dart';



class ClientActivitiesState extends Equatable {
  final BlocStatus getClientActivitiesStatus;
  final BlocStatus updateClientActivityStatus;
  final List<ClientActivityModel> clientActivities;
  final int currentPage;
  final int totalCount;

  const ClientActivitiesState({
    this.getClientActivitiesStatus = const BlocStatus.initial(),
    this.updateClientActivityStatus = const BlocStatus.initial(),
    this.clientActivities = const [],
    this.currentPage = 1,
    this.totalCount = 0,

  });

  ClientActivitiesState copyWith({
    BlocStatus? getClientActivitiesStatus,
    BlocStatus? updateClientActivityStatus,
    List<ClientActivityModel>? careActivities,
    int? totalCount,
    int? currentPage,

  }) {
    return ClientActivitiesState(
      getClientActivitiesStatus: getClientActivitiesStatus ?? this.getClientActivitiesStatus,
      updateClientActivityStatus: updateClientActivityStatus ?? this.updateClientActivityStatus,
      clientActivities: careActivities ?? this.clientActivities,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,

    );
  }

  @override
  List<Object> get props => [getClientActivitiesStatus, updateClientActivityStatus,  clientActivities, currentPage, ];
}