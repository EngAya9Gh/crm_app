part of 'care_activities_bloc.dart';



class CareActivitiesState extends Equatable {
  final BlocStatus getAllCareActivitiesStatus;
  final BlocStatus updateClientActivityStatus;
  final List<ClientActivityModel> careActivities;
  final int currentPage;
  final int totalCount;

  const CareActivitiesState({
    this.getAllCareActivitiesStatus = const BlocStatus.initial(),
    this.updateClientActivityStatus = const BlocStatus.initial(),
    this.careActivities = const [],
    this.currentPage = 1,
    this.totalCount = 0,

  });

  CareActivitiesState copyWith({
    BlocStatus? getAllCareActivitiesStatus,
    BlocStatus? updateClientActivityStatus,
    List<ClientActivityModel>? careActivities,
    int? totalCount,
    int? currentPage,

  }) {
    return CareActivitiesState(
      getAllCareActivitiesStatus: getAllCareActivitiesStatus ?? this.getAllCareActivitiesStatus,
      updateClientActivityStatus: updateClientActivityStatus ?? this.updateClientActivityStatus,
      careActivities: careActivities ?? this.careActivities,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,

    );
  }

  @override
  List<Object> get props => [getAllCareActivitiesStatus, updateClientActivityStatus,  careActivities, currentPage, ];
}