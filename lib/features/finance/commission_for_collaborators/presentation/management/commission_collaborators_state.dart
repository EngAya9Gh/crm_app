part of 'commission_collaborators_bloc.dart';

@immutable
class CommissionCollaboratorsState {
  final BlocStatus<CommissionCollaboratorsResponseModel> commissionCollaboratorsResponse;
  final BlocStatus gettingData;
  final bool hasReachedMax;
  final int totalCount;
  final BlocStatus<List<ParticipateModel>> listParticipate;
  const CommissionCollaboratorsState({
    this.commissionCollaboratorsResponse = const BlocStatus.initial(),
    this.gettingData = const BlocStatus.initial(),
    this.listParticipate = const BlocStatus.initial(),
    this.hasReachedMax = false,
    this.totalCount = 0,
  });

  CommissionCollaboratorsState copyWith({
    BlocStatus<CommissionCollaboratorsResponseModel>? commissionCollaboratorsResponse,
    BlocStatus? gettingData,
    BlocStatus<List<ParticipateModel>>? listParticipate,
    bool? hasReachedMax,
    int? totalCount,
  }) {
    return CommissionCollaboratorsState(
      commissionCollaboratorsResponse: commissionCollaboratorsResponse ?? this.commissionCollaboratorsResponse,
      gettingData: gettingData ?? this.gettingData,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalCount: totalCount ?? this.totalCount,
      listParticipate: listParticipate ?? this.listParticipate,
    );
  }
}
