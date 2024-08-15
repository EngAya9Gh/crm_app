part of 'previous_ratings_cubit.dart';

class PreviousRatingsState extends Equatable {
  final BlocStatus getPreviousRatingsStatus;
  final BlocStatus locallyFilterPreviousRatingsStatus;

  PreviousRatingsState({
    this.getPreviousRatingsStatus = const BlocStatus.initial(),
    this.locallyFilterPreviousRatingsStatus = const BlocStatus.initial(),
  });

  PreviousRatingsState copyWith({
    BlocStatus? getPreviousRatingsStatus,
    BlocStatus? locallyFilterPreviousRatingsStatus,
  }) {
    return PreviousRatingsState(
      getPreviousRatingsStatus:
          getPreviousRatingsStatus ?? this.getPreviousRatingsStatus,
      locallyFilterPreviousRatingsStatus: locallyFilterPreviousRatingsStatus ??
          this.locallyFilterPreviousRatingsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getPreviousRatingsStatus,
      locallyFilterPreviousRatingsStatus,
    ];
  }
}
