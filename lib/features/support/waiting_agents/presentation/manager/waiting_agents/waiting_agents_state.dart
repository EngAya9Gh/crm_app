part of 'waiting_agents_cubit.dart';

class WaitingAgentsState extends Equatable {
  final BlocStatus getWaitingAgentsStatus;
  final GetWaitingAgentsParams getWaitingAgentsParams;
  final int totalCount;
  final bool resetData;
  final bool reachedMax;
  const WaitingAgentsState({
    this.getWaitingAgentsStatus = const BlocStatus.initial(),
    this.getWaitingAgentsParams = const GetWaitingAgentsParams(),
    this.resetData = true,
    this.reachedMax = false,
    this.totalCount = 0,
  });

  WaitingAgentsState copyWith({
    BlocStatus? getWaitingAgentsStatus,
    GetWaitingAgentsParams? getWaitingAgentsParams,
    bool? resetData,
    bool? reachedMax,
    int? totalCount,
  }) {
    return WaitingAgentsState(
      getWaitingAgentsStatus: getWaitingAgentsStatus ?? this.getWaitingAgentsStatus,
      getWaitingAgentsParams: getWaitingAgentsParams ?? this.getWaitingAgentsParams,
      resetData: resetData ?? this.resetData,
      reachedMax: reachedMax ?? this.reachedMax,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object> get props => [getWaitingAgentsStatus,getWaitingAgentsParams,resetData,reachedMax,totalCount];
}
