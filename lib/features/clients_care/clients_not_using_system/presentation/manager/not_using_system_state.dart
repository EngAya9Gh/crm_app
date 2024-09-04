part of 'not_using_system_cubit.dart';

class NotUsingSystemState extends Equatable {
  final BlocStatus getNotUsingSystemStatus;

  NotUsingSystemState({
    this.getNotUsingSystemStatus = const BlocStatus.initial(),
  });

  NotUsingSystemState copyWith({
    BlocStatus? getNotUsingSystemStatus,
  }) {
    return NotUsingSystemState(
      getNotUsingSystemStatus:
          getNotUsingSystemStatus ?? this.getNotUsingSystemStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getNotUsingSystemStatus,
    ];
  }
}
