part of 'commission_collaborators_bloc.dart';

@immutable
class CommissionCollaboratorsState {
  final BlocStatus<CommissionCollaboratorsResponseModel> commissionCollaboratorsResponse;
  final bool hasReachedMax;
  final int totalCount;
  const CommissionCollaboratorsState({
    this.commissionCollaboratorsResponse = const BlocStatus.initial(),
    this.hasReachedMax = false,
    this.totalCount = 0,
  });

  CommissionCollaboratorsState copyWith({
    BlocStatus<CommissionCollaboratorsResponseModel>? commissionCollaboratorsResponse,
    bool? hasReachedMax,
    int? totalCount,
  }) {
    return CommissionCollaboratorsState(
      commissionCollaboratorsResponse: commissionCollaboratorsResponse ?? this.commissionCollaboratorsResponse,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
