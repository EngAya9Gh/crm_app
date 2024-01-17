part of 'privilege_cubit.dart';

@immutable
class PrivilegeState {
  const PrivilegeState({
    this.levelsState = const PageState.init(),
    this.privilegesOfLevel = const PageState.init(),
    this.privilegesOfLevelTemp = const PageState.init(),
    this.userPrivilegesState = const PageState.init(),
    this.addLevelStatus = const BlocStatus.initial(),
    this.updatePrivilegeStatus = const BlocStatus.initial(),
    this.priorityState = const <LevelModel>[],
    this.selectedLevelId,
  });

  final PageState<List<LevelModel>> levelsState;
  final List<LevelModel> priorityState;
  final PageState<List<PrivilegeModel>> privilegesOfLevel;
  final PageState<List<PrivilegeModel>> privilegesOfLevelTemp;
  final PageState<List<PrivilegeModel>> userPrivilegesState;
  final BlocStatus addLevelStatus;
  final BlocStatus updatePrivilegeStatus;
  final String? selectedLevelId;

  PrivilegeState copyWith({
    PageState<List<LevelModel>>? levelsState,
    PageState<List<PrivilegeModel>>? userPrivilegesState,
    PageState<List<PrivilegeModel>>? privilegesOfLevel,
    PageState<List<PrivilegeModel>>? privilegesOfLevelTemp,
    BlocStatus? addLevelStatus,
    BlocStatus? updatePrivilegeStatus,
    final List<LevelModel>? priorityState,
    Nullable<String?>? selectedLevelId,
  }) {
    return PrivilegeState(
      levelsState: levelsState ?? this.levelsState,

      userPrivilegesState: userPrivilegesState ?? this.userPrivilegesState,
      addLevelStatus: addLevelStatus ?? this.addLevelStatus,
      privilegesOfLevel: privilegesOfLevel ?? this.privilegesOfLevel,
      privilegesOfLevelTemp: privilegesOfLevelTemp ?? this.privilegesOfLevelTemp,
      updatePrivilegeStatus: updatePrivilegeStatus ?? this.updatePrivilegeStatus,
      priorityState: priorityState ?? this.priorityState,
      selectedLevelId: selectedLevelId != null ? selectedLevelId.value : this.selectedLevelId,
    );
  }
}
