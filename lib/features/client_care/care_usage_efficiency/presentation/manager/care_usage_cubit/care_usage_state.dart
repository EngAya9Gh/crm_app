part of 'care_usage_cubit.dart';

class CareUsageState extends Equatable {
  final BlocStatus getCareUsageListStatus;
  final BlocStatus doneCommunicationStatus;
  final List<CareUsageModel> careUsageList;

  const CareUsageState({
    this.getCareUsageListStatus = const BlocStatus.initial(),
    this.doneCommunicationStatus = const BlocStatus.initial(),
    this.careUsageList = const [],
  });

  CareUsageState copyWith({
    BlocStatus? getCareUsageListStatus,
    BlocStatus? doneCommunicationStatus,
    List<CareUsageModel>? careUsageList,
  }) {
    return CareUsageState(
      getCareUsageListStatus:
          getCareUsageListStatus ?? this.getCareUsageListStatus,
      doneCommunicationStatus:
          doneCommunicationStatus ?? this.doneCommunicationStatus,
      careUsageList: careUsageList ?? this.careUsageList,
    );
  }

  @override
  List<Object?> get props => [
        getCareUsageListStatus,
        doneCommunicationStatus,
        careUsageList,
      ];
}
