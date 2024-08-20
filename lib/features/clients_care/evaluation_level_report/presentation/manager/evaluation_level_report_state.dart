part of 'evaluation_level_report_cubit.dart';

class EvaluationLevelReportState extends Equatable {
  final BlocStatus getEvaluationLevelReportStatus;
  final BlocStatus filterPeriodicCommunicationStatus;

  EvaluationLevelReportState({
    this.getEvaluationLevelReportStatus = const BlocStatus.initial(),
    this.filterPeriodicCommunicationStatus = const BlocStatus.initial(),
  });

  EvaluationLevelReportState copyWith({
    BlocStatus? getEvaluationLevelReportStatus,
    BlocStatus? filterPeriodicCommunicationStatus,
  }) {
    return EvaluationLevelReportState(
      getEvaluationLevelReportStatus:
          getEvaluationLevelReportStatus ?? this.getEvaluationLevelReportStatus,
      filterPeriodicCommunicationStatus: filterPeriodicCommunicationStatus ??
          this.filterPeriodicCommunicationStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getEvaluationLevelReportStatus,
      filterPeriodicCommunicationStatus,
    ];
  }
}
