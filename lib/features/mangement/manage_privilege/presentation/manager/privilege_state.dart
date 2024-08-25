part of 'privilege_cubit.dart';

@immutable
class PrivilegeState {
  const PrivilegeState({
    this.levelsStatus = const PageState.init(),
    this.getPrivileges = const BlocStatus.initial(),
    this.tempPrivileges = const PageState.init(),
    this.userPrivilegesState = const PageState.init(),
    this.addLevelStatus = const BlocStatus.initial(),
    this.updatePrivilegeStatus = const BlocStatus.initial(),
    this.levelsList = const <LevelModel>[],
    this.selectedLevelId,
  });

  final PageState<List<LevelModel>> levelsStatus;
  final List<LevelModel> levelsList;
  final BlocStatus getPrivileges;
  final PageState<List<PrivilegeModel>> tempPrivileges;
  final PageState<List<PrivilegeModel>> userPrivilegesState;
  final BlocStatus addLevelStatus;
  final BlocStatus updatePrivilegeStatus;
  final String? selectedLevelId;

  PrivilegeState copyWith({
    PageState<List<LevelModel>>? levelsState,
    PageState<List<PrivilegeModel>>? userPrivilegesState,
    BlocStatus? getPrivileges,
    PageState<List<PrivilegeModel>>? tempPrivileges,
    BlocStatus? addLevelStatus,
    BlocStatus? updatePrivilegeStatus,
    final List<LevelModel>? priorityState,
    Nullable<String?>? selectedLevelId,
  }) {
    return PrivilegeState(
      levelsStatus: levelsState ?? this.levelsStatus,
      userPrivilegesState: userPrivilegesState ?? this.userPrivilegesState,
      addLevelStatus: addLevelStatus ?? this.addLevelStatus,
      getPrivileges: getPrivileges ?? this.getPrivileges,
      tempPrivileges: tempPrivileges ?? this.tempPrivileges,
      updatePrivilegeStatus:
          updatePrivilegeStatus ?? this.updatePrivilegeStatus,
      levelsList: priorityState ?? this.levelsList,
      selectedLevelId: selectedLevelId != null
          ? selectedLevelId.value
          : this.selectedLevelId,
    );
  }
}
