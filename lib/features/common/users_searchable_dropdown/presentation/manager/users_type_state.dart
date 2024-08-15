part of 'users_type_cubit.dart';

class UsersTypeState extends Equatable {
  final BlocStatus getUsersStatus;
  final String tag;

  final BlocStatus selectUserStatus;

  UsersTypeState({
    this.getUsersStatus = const BlocStatus.initial(),
    this.tag = '',
    this.selectUserStatus = const BlocStatus.initial(),
  });

  UsersTypeState copyWith({
    BlocStatus? getUsersStatus,
    String? tag,
    BlocStatus? selectUserStatus,
  }) {
    return UsersTypeState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      tag: tag ?? this.tag,
      selectUserStatus: selectUserStatus ?? this.selectUserStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getUsersStatus,
      tag,
      selectUserStatus,
    ];
  }
}
