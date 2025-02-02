part of 'users_cubit.dart';

class UsersState extends Equatable {
  const UsersState({
    this.getUsersStatus = const BlocStatus.initial(),
    this.getUserByIdStatus = const BlocStatus.initial(),
    this.managesStatus = const BlocStatus.initial(),
    this.branchesStatus = const BlocStatus.initial(),
    this.levelsStatus = const BlocStatus.initial(),
    this.getUserSelected = const BlocStatus.initial(),
    this.actionUserState = const BlocStatus.initial(),
    this.currentUser,
    this.usersByDepartmentAndRegion = const PageState.init(),
  });

  final BlocStatus getUsersStatus;
  final BlocStatus getUserByIdStatus;
  final BlocStatus<List<ManageModel>> managesStatus;
  final BlocStatus<List<BranchModel>> branchesStatus;
  final BlocStatus<List<LevelModel>> levelsStatus;
  final BlocStatus<List<ManagementModel>> getUserSelected;
  final BlocStatus actionUserState;
  final UserModel? currentUser;
  final PageState<List<UserRegionDepartment>> usersByDepartmentAndRegion;

  UsersState copyWith({
    BlocStatus<List<ManagementModel>>? getUserSelected,
    BlocStatus? getUsersStatus,
    BlocStatus? getUserByIdStatus,
    BlocStatus<List<ManageModel>>? managesStatus,
    BlocStatus<List<BranchModel>>? branchesStatus,
    BlocStatus<List<LevelModel>>? levelsStatus,
    BlocStatus<List<UserModel>>? userSelected,
    BlocStatus? actionUserState,
    UserModel? currentUser,
    PageState<List<UserRegionDepartment>>? usersByDepartmentAndRegion,
  }) {
    return UsersState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      getUserByIdStatus: getUserByIdStatus ?? this.getUserByIdStatus,
      getUserSelected: getUserSelected ?? this.getUserSelected,
      managesStatus: managesStatus ?? this.managesStatus,
      branchesStatus: branchesStatus ?? this.branchesStatus,
      levelsStatus: levelsStatus ?? this.levelsStatus,
      actionUserState: actionUserState ?? this.actionUserState,
      currentUser: currentUser ?? this.currentUser,
      usersByDepartmentAndRegion:
      usersByDepartmentAndRegion ?? this.usersByDepartmentAndRegion,
    );
  }

  @override
  List<Object?> get props {
    return [
      getUsersStatus,
      getUserByIdStatus,
      managesStatus,
      branchesStatus,
      levelsStatus,
      actionUserState,
      currentUser,
      usersByDepartmentAndRegion,
      getUserSelected,
    ];
  }
}
