part of 'privileges_cubit.dart';

class PrivilegesState extends Equatable {
  final int refreshUi;

  final BlocStatus getPrivilegesStatus;
  final BlocStatus updatePrivilegesStatus;

  const PrivilegesState({
    this.refreshUi = 1,
    this.getPrivilegesStatus = const BlocStatus.initial(),
    this.updatePrivilegesStatus = const BlocStatus.initial(),
  });

  PrivilegesState copyWith({
    int? refreshUi,
    BlocStatus? getPrivilegesStatus,
    BlocStatus? updatePrivilegesStatus,
  }) {
    return PrivilegesState(
      refreshUi: refreshUi ?? this.refreshUi,
      getPrivilegesStatus: getPrivilegesStatus ?? this.getPrivilegesStatus,
      updatePrivilegesStatus:
          updatePrivilegesStatus ?? this.updatePrivilegesStatus,
    );
  }

  @override
  List<Object> get props =>
      [refreshUi, getPrivilegesStatus, updatePrivilegesStatus];
}
