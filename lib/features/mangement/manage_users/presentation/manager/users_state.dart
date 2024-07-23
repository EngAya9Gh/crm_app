part of 'users_cubit.dart';

class UsersState extends Equatable {
  const UsersState({
    this.getUsersStatus = const BlocStatus.initial(),
    this.managesStatus = const BlocStatus.initial(),
    this.branchesStatus = const BlocStatus.initial(),
    this.levelsStatus = const BlocStatus.initial(),
    this.actionUserState = const BlocStatus.initial(),
    this.currentUser,
    this.usersByDepartmentAndRegion = const PageState.init(),
  });

  final BlocStatus getUsersStatus;
  final BlocStatus<List<ManageModel>> managesStatus;
  final BlocStatus<List<BranchModel>> branchesStatus;
  final BlocStatus<List<LevelModel>> levelsStatus;
  final BlocStatus actionUserState;
  final UserModel? currentUser;
  final PageState<List<UserRegionDepartment>> usersByDepartmentAndRegion;

  @override
  List<Object?> get props => [
        getUsersStatus,
        managesStatus,
        branchesStatus,
        levelsStatus,
        actionUserState,
        currentUser,
        usersByDepartmentAndRegion,
      ];

  UsersState copyWith({
    BlocStatus? getUsersStatus,
    BlocStatus<List<ManageModel>>? managesStatus,
    BlocStatus<List<BranchModel>>? branchesStatus,
    BlocStatus<List<LevelModel>>? levelsStatus,
    BlocStatus? actionUserState,
    UserModel? currentUser,
    PageState<List<UserRegionDepartment>>? usersByDepartmentAndRegion,
  }) {
    return UsersState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      managesStatus: managesStatus ?? this.managesStatus,
      branchesStatus: branchesStatus ?? this.branchesStatus,
      levelsStatus: levelsStatus ?? this.levelsStatus,
      actionUserState: actionUserState ?? this.actionUserState,
      currentUser: currentUser ?? this.currentUser,
      usersByDepartmentAndRegion:
          usersByDepartmentAndRegion ?? this.usersByDepartmentAndRegion,
    );
  }
}
