part of 'crud_activities_bloc.dart';



class CrudActivitiesState extends Equatable {
  final BlocStatus getAllCrudActivitiesStatus;
  final BlocStatus updateClientActivityStatus;
  final BlocStatus addClientActivityStatus;
  final BlocStatus getActivityTypesStatus;
  final BlocStatus getSubscribedClientsStatus;
  final List<ClientActivityModel> clientActivities;
  final List<ActivityTypeModel>  activityTypesList;
  final List<SubscribedClientModel>  subscribedClientsList;
  final int currentPage;
  final int totalCount;
  final bool wholeDay;

  const CrudActivitiesState({
    this.getAllCrudActivitiesStatus = const BlocStatus.initial(),
    this.updateClientActivityStatus = const BlocStatus.initial(),
    this.addClientActivityStatus = const BlocStatus.initial(),
    this.getActivityTypesStatus = const BlocStatus.initial(),
    this.getSubscribedClientsStatus = const BlocStatus.initial(),
    this.clientActivities = const [],
    this.activityTypesList = const [],
    this.subscribedClientsList = const [],
    this.currentPage = 1,
    this.totalCount = 0,
    this.wholeDay = false
  });

  CrudActivitiesState copyWith({
    BlocStatus? getAllCrudActivitiesStatus,
    BlocStatus? updateClientActivityStatus,
    BlocStatus? addClientActivityStatus,
    BlocStatus? getActivityTypesStatus,
    BlocStatus? getSubscribedClientsStatus,
    List<ClientActivityModel>? clientActivities,
    List<ActivityTypeModel>? activityTypesList,
    List<SubscribedClientModel>? subscribedClientsList,
    int? totalCount,
    int? currentPage,
    bool? wholeDay,

  }) {
    return CrudActivitiesState(
      getAllCrudActivitiesStatus: getAllCrudActivitiesStatus ?? this.getAllCrudActivitiesStatus,
      updateClientActivityStatus: updateClientActivityStatus ?? this.updateClientActivityStatus,
      addClientActivityStatus: addClientActivityStatus ?? this.addClientActivityStatus,
      getActivityTypesStatus: getActivityTypesStatus ?? this.getActivityTypesStatus,
      getSubscribedClientsStatus: getSubscribedClientsStatus ?? this.getSubscribedClientsStatus,
      clientActivities: clientActivities ?? this.clientActivities,
      activityTypesList: activityTypesList ?? this.activityTypesList,
      subscribedClientsList: subscribedClientsList ?? this.subscribedClientsList,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
      wholeDay: wholeDay ?? this.wholeDay,

    );
  }

  @override
  List<Object> get props => [getAllCrudActivitiesStatus,wholeDay, updateClientActivityStatus,getSubscribedClientsStatus,subscribedClientsList,getActivityTypesStatus, addClientActivityStatus, clientActivities, currentPage, activityTypesList, ];
}