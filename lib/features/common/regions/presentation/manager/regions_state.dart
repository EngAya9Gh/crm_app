part of 'regions_cubit.dart';

class RegionsState extends Equatable {
  final BlocStatus getRegionStatus;
  final BlocStatus selectRegionStatus;

  const RegionsState({
    this.getRegionStatus = const BlocStatus.initial(),
    this.selectRegionStatus = const BlocStatus.initial(),
  });

  RegionsState copyWith({
    BlocStatus? getRegionStatus,
    BlocStatus? selectRegionStatus,
  }) {
    return RegionsState(
      getRegionStatus: getRegionStatus ?? this.getRegionStatus,
      selectRegionStatus: selectRegionStatus ?? this.selectRegionStatus,
    );
  }

  @override
  List<Object> get props => [getRegionStatus, selectRegionStatus];
}
