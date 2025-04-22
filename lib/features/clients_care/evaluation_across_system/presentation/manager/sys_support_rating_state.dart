part of 'sys_support_rating_bloc.dart';

@immutable
class SysSupportRatingState {
  final BlocStatus<List<ElevationModel>> listRating;

  const SysSupportRatingState({
    this.listRating = const BlocStatus.initial(),
  });

  SysSupportRatingState copyWith({
    final BlocStatus<List<ElevationModel>>? listRating,
  }) {
    return SysSupportRatingState(
      listRating: listRating??this.listRating,
    );
  }
}
