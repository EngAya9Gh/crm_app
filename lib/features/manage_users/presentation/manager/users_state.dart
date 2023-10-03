part of 'users_cubit.dart';

class UsersState extends Equatable {
  const UsersState({
    this.allUsersList = const PageState.init(),
    this.allUsers = const [],
    this.actionUserState = const BlocStatus.initial(),
    this.currentUser,
  });

  final PageState<List<UserModel>> allUsersList;
  final List<UserModel> allUsers;
  final BlocStatus actionUserState;
  final UserModel? currentUser;

  @override
  List<Object?> get props => [allUsersList, allUsers, actionUserState, currentUser];

  UsersState copyWith({
    PageState<List<UserModel>>? allUsersList,
    List<UserModel>? allUsers,
    BlocStatus? actionUserState,
    UserModel? currentUser,
  }) {
    return UsersState(
      allUsersList: allUsersList ?? this.allUsersList,
      allUsers: allUsers ?? this.allUsers,
      actionUserState: actionUserState ?? this.actionUserState,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
