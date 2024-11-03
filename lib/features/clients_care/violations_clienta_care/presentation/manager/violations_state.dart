part of 'violations_cubit.dart';

class ViolationsState extends Equatable {
  final BlocStatus getViolationsStatus;
  final BlocStatus getManagementStatus;
  final BlocStatus updateViolationStatus;
  final BlocStatus getViolationTypesStatus;

  ViolationsState({
    this.getViolationsStatus = const BlocStatus.initial(),
    this.updateViolationStatus = const BlocStatus.initial(),
    this.getManagementStatus = const BlocStatus.initial(),
    this.getViolationTypesStatus = const BlocStatus.initial(),
  });

  ViolationsState copyWith({
    BlocStatus? getViolationsStatus,
    BlocStatus? updateViolationStatus,
    BlocStatus? getViolationTypesStatus,
    BlocStatus? getManagementStatus,
  }) {
    return ViolationsState(
      getViolationsStatus: getViolationsStatus ?? this.getViolationsStatus,
      updateViolationStatus: updateViolationStatus ?? this.updateViolationStatus,
      getViolationTypesStatus: getViolationTypesStatus ?? this.getViolationTypesStatus,
      getManagementStatus: getManagementStatus ?? this.getManagementStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getViolationsStatus,
      updateViolationStatus,
      getManagementStatus,
      getViolationTypesStatus,
    ];
  }
}
