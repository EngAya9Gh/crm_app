part of 'install_quality_cubit.dart';

class InstallQualityState extends Equatable {
  final BlocStatus getInstallStatus;
  final BlocStatus locallyFilterInstallStatus;

  InstallQualityState({
    this.getInstallStatus = const BlocStatus.initial(),
    this.locallyFilterInstallStatus = const BlocStatus.initial(),
  });

  InstallQualityState copyWith({
    BlocStatus? getInstallStatus,
    BlocStatus? locallyFilterInstallStatus,
  }) {
    return InstallQualityState(
      getInstallStatus: getInstallStatus ?? this.getInstallStatus,
      locallyFilterInstallStatus:
          locallyFilterInstallStatus ?? this.locallyFilterInstallStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getInstallStatus,
      locallyFilterInstallStatus,
    ];
  }
}
