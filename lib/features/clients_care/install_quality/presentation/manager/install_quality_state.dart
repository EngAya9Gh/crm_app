part of 'install_quality_cubit.dart';

class InstallQualityState extends Equatable {
  final BlocStatus getInstallStatus;

  InstallQualityState({
    this.getInstallStatus = const BlocStatus.initial(),
  });

  InstallQualityState copyWith({
    BlocStatus? getInstallStatus,
  }) {
    return InstallQualityState(
      getInstallStatus: getInstallStatus ?? this.getInstallStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getInstallStatus,
    ];
  }
}
