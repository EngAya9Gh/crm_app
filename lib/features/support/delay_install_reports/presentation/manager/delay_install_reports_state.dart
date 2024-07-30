part of 'delay_install_reports_cubit.dart';

class DelayInstallReportsState extends Equatable {
  final BlocStatus<bool> getDelayInstallReportsStatus;
  final BlocStatus locallyFilterDelayInstallReportsStatus;

  DelayInstallReportsState({
    this.getDelayInstallReportsStatus = const BlocStatus<bool>.initial(),
    this.locallyFilterDelayInstallReportsStatus =
        const BlocStatus<bool>.initial(),
  });

  DelayInstallReportsState copyWith({
    BlocStatus<bool>? getDelayInstallReportsStatus,
    BlocStatus? locallyFilterDelayInstallReportsStatus,
  }) {
    return DelayInstallReportsState(
      getDelayInstallReportsStatus:
          getDelayInstallReportsStatus ?? this.getDelayInstallReportsStatus,
      locallyFilterDelayInstallReportsStatus:
          locallyFilterDelayInstallReportsStatus ??
              this.locallyFilterDelayInstallReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getDelayInstallReportsStatus,
      locallyFilterDelayInstallReportsStatus,
    ];
  }
}
