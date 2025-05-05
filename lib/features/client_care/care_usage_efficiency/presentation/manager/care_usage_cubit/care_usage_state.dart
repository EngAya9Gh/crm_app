part of 'care_usage_cubit.dart';

class CareUsageState extends Equatable {
  final BlocStatus getCareUsageListStatus;

  const CareUsageState({
    this.getCareUsageListStatus = const BlocStatus.initial(),
  });

  CareUsageState copyWith({
    BlocStatus? getCareUsageListStatus,
  }) {
    return CareUsageState(
      getCareUsageListStatus:
          getCareUsageListStatus ?? this.getCareUsageListStatus,
    );
  }

  @override
  List<Object> get props => [
        getCareUsageListStatus,
      ];
}