part of 'branches_cubit.dart';

class BranchesState extends Equatable {
  final BlocStatus getBranchesStatus;
  final BlocStatus selectBranchStatus;

  const BranchesState({
    this.getBranchesStatus = const BlocStatus.initial(),
    this.selectBranchStatus = const BlocStatus.initial(),
  });

  BranchesState copyWith({
    BlocStatus? getBranchesStatus,
    BlocStatus? selectBranchStatus,
  }) {
    return BranchesState(
      getBranchesStatus: getBranchesStatus ?? this.getBranchesStatus,
      selectBranchStatus: selectBranchStatus ?? this.selectBranchStatus,
    );
  }

  @override
  List<Object> get props => [getBranchesStatus, selectBranchStatus];
}
