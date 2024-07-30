part of 'delay_after_install_cubit.dart';

class DelayAfterInstallState extends Equatable {
  final BlocStatus<bool> getDelayAfterInstallStatus;
  final BlocStatus locallyFilterDelayAfterInstallStatus;

  DelayAfterInstallState({
    this.getDelayAfterInstallStatus = const BlocStatus<bool>.initial(),
    this.locallyFilterDelayAfterInstallStatus =
        const BlocStatus<bool>.initial(),
  });

  DelayAfterInstallState copyWith({
    BlocStatus<bool>? getDelayAfterInstallStatus,
    BlocStatus? locallyFilterDelayAfterInstallStatus,
  }) {
    return DelayAfterInstallState(
      getDelayAfterInstallStatus:
          getDelayAfterInstallStatus ?? this.getDelayAfterInstallStatus,
      locallyFilterDelayAfterInstallStatus:
          locallyFilterDelayAfterInstallStatus ??
              this.locallyFilterDelayAfterInstallStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getDelayAfterInstallStatus,
      locallyFilterDelayAfterInstallStatus,
    ];
  }
}
