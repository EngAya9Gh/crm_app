part of 'levels_cubit.dart';

class LevelsState extends Equatable {
  final BlocStatus getLevelStatus;
  final BlocStatus addLevelStatus;

  const LevelsState({
    this.getLevelStatus = const BlocStatus.initial(),
    this.addLevelStatus = const BlocStatus.initial(),
  });

  LevelsState copyWith({
    BlocStatus? getLevelStatus,
    BlocStatus? addLevelStatus,
  }) {
    return LevelsState(
      getLevelStatus: getLevelStatus ?? this.getLevelStatus,
      addLevelStatus: addLevelStatus ?? this.addLevelStatus,
    );
  }

  @override
  List<Object> get props => [getLevelStatus, addLevelStatus];
}
