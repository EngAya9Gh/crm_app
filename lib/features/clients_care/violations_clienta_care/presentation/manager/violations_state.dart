part of 'violations_cubit.dart';

class ViolationsState extends Equatable {
  final BlocStatus getViolationsStatus;

  ViolationsState({
    this.getViolationsStatus = const BlocStatus.initial(),
  });

  ViolationsState copyWith({
    BlocStatus? getViolationsStatus,
  }) {
    return ViolationsState(
      getViolationsStatus:
          getViolationsStatus ?? this.getViolationsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getViolationsStatus,
    ];
  }
}
