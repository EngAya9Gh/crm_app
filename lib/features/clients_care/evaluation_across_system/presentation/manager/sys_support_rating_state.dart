part of 'sys_support_rating_bloc.dart';

@immutable
class SysSupportRatingState {
  final BlocStatus<List<ElevationModel>> listRating;
  final BlocStatus statusListRating;
  final int totalCount;
  final bool hasReachedEnd;
  const SysSupportRatingState({
    this.listRating = const BlocStatus.initial(),
    this.statusListRating = const BlocStatus.initial(),
    this.totalCount = 0,
    this.hasReachedEnd = false,
  });

  SysSupportRatingState copyWith({
    final BlocStatus<List<ElevationModel>>? listRating,
    final BlocStatus? statusListRating,
    final int? totalCount,
    final bool? hasReachedEnd,
  }) {
    return SysSupportRatingState(
      listRating: listRating ?? this.listRating,
      statusListRating: statusListRating ?? this.statusListRating,
      totalCount: totalCount ?? this.totalCount,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
    );
  }
}
